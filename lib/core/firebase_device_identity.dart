import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import 'device_identity.dart';

/// Implementação real: login anônimo do Firebase Auth, sem nenhuma tela —
/// `signInAnonymously()` cria (ou recupera) um UID estável para este
/// aparelho/navegador, só na 1ª vez (sem sessão nenhuma ainda). Depois
/// disso, `currentUserId()` **sempre** reflete `FirebaseAuth.instance.currentUser`
/// ao vivo, sem cachear o UID — se cacheasse (como uma versão anterior
/// fazia), o UID continuaria "preso" no anônimo mesmo depois de um login
/// bem-sucedido (`registerWithEmail`/`signInWithEmail`/`signInWithGoogle`
/// trocam o usuário atual pro UID da conta) — todo `fetch()`/`save()` de
/// progresso continuaria lendo/escrevendo no documento anônimo errado,
/// nunca no da conta de verdade. Achado real do usuário: progresso jogado
/// antes de logar "sumia" depois do login — na verdade estava sendo salvo
/// sempre no mesmo UID anônimo cacheado, nunca no UID da conta. Ver
/// `.claude/memory/decisions.md`.
class FirebaseDeviceIdentity implements DeviceIdentity {
  /// Seam de testabilidade: instância de `FirebaseAuth` injetável (opcional).
  /// Quando `null` (produção via provider `@Riverpod(keepAlive: true)`), a
  /// instância real é resolvida **de forma preguiçosa** dentro de
  /// `currentUserId()`, sob o `try/catch` — nunca no construtor. Isso evita
  /// tocar em `FirebaseAuth.instance` antes de `Firebase.initializeApp(...)`
  /// (o que lançaria `[core/no-app]`), preservando o contrato de que a
  /// construção do provider e `currentUserId()` nunca lançam. Em testes,
  /// permite injetar um fake que controle `currentUser`, `authStateChanges()`
  /// e se `signInAnonymously()` foi chamado, sem tocar no Firebase real.
  final FirebaseAuth? _injectedAuth;

  FirebaseDeviceIdentity({FirebaseAuth? auth}) : _injectedAuth = auth;

  /// Timeout de segurança para a restauração assíncrona da sessão. Na web, o
  /// Firebase restaura a sessão anônima persistida (IndexedDB) de forma
  /// assíncrona; `authStateChanges()` sinaliza o fim dessa restauração. Se ela
  /// não concluir dentro deste prazo, degradamos com segurança para a criação
  /// de um novo anônimo (após reconferir `currentUser`), sem travar o boot.
  static const Duration _restoreTimeout = Duration(seconds: 3);

  @override
  Future<String?> currentUserId() async {
    try {
      // Resolução preguiçosa da instância: em produção, só toca em
      // `FirebaseAuth.instance` aqui dentro (sob o try/catch), depois de o
      // Firebase já ter sido inicializado. Em testes, usa o fake injetado.
      final auth = _injectedAuth ?? FirebaseAuth.instance;

      // Atalho síncrono: se a sessão já está em memória, retorna imediatamente
      // (preserva 3.1 e o caso de sessão já disponível). Sem tocar em
      // authStateChanges()/signInAnonymously().
      final existing = auth.currentUser;
      if (existing != null) return existing.uid;

      // currentUser síncrono é null. Na web, isso é ambíguo no boot: pode ser
      // "restauração ainda não terminou" OU "realmente não há sessão". Em vez
      // de criar um anônimo de imediato, aguardamos o sinal de restauração
      // (primeiro estado de auth não-nulo) com um timeout de segurança. Se a
      // restauração não concluir a tempo (TimeoutException), tratamos como
      // "não concluída → reconferir/criar" — o timeout NÃO retorna null aqui.
      try {
        await auth
            .authStateChanges()
            .firstWhere((user) => user != null)
            .timeout(_restoreTimeout);
      } on TimeoutException {
        // Restauração não concluiu dentro do prazo. Segue para reconferir
        // currentUser e, se ainda null, criar o anônimo (degradação segura).
      }

      // Reconferir após a espera (ou timeout): se a sessão foi restaurada,
      // reutiliza o UID existente e evita criar um UID novo/volátil.
      final restored = auth.currentUser;
      if (restored != null) return restored.uid;

      // Nenhuma sessão restaurável: primeira execução real (ou degradação após
      // timeout). Cria o anônimo e retorna o UID criado.
      final credential = await auth.signInAnonymously();
      return credential.user?.uid;
    } catch (_) {
      // Qualquer falha genuína (leitura de currentUser, signInAnonymously,
      // etc.) vira null — nunca lança para fora (preserva 2.4/3.5).
      return null;
    }
  }
}
