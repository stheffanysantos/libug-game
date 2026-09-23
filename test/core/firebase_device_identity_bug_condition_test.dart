import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:debuga_o_mascote/core/firebase_device_identity.dart';

/// Teste exploratório da **Bug Condition** (Property 1 do design
/// `sessao-anonima-estavel`).
///
/// **CRÍTICO — semântica de teste de exploração de bug**: este teste é
/// ESPERADO FALHAR no código NÃO corrigido (`F`). A falha CONFIRMA o bug:
/// sob a bug condition (web, restauração assíncrona ainda pendente,
/// `currentUser` síncrono `null`, sessão anônima válida `A` persistida no
/// IndexedDB), `F` lê `currentUser == null` e chama `signInAnonymously()`
/// imediatamente, retornando um UID novo `B != A` — abandonando `A`.
///
/// Bug Condition (do design):
///   platform = WEB AND authRestoreCompleted = false
///   AND currentUserSync = null AND persistedAnonymousSessionExists = true
///
/// Asserções (Property 1):
///   resultado == A (X.persistedAnonymousUid)
///   E signInAnonymously NÃO foi chamado.
///
/// Este mesmo teste é reutilizado na tarefa 4.2 para verificar o fix — quando
/// passar, confirma que `F'` reutiliza a sessão restaurada. NÃO escrever um
/// teste novo lá.

/// Fake de [User] — só o `uid` importa para a decisão de `currentUserId()`.
class _FakeUser extends Fake implements User {
  _FakeUser(this._uid);

  final String _uid;

  @override
  String get uid => _uid;
}

/// Fake de [UserCredential] retornado por `signInAnonymously()`.
class _FakeUserCredential extends Fake implements UserCredential {
  _FakeUserCredential(this._user);

  final User? _user;

  @override
  User? get user => _user;
}

/// Fake de [FirebaseAuth] injetado via o seam da tarefa 1
/// (`FirebaseDeviceIdentity({FirebaseAuth? auth})`).
///
/// Modela o cenário web da bug condition:
/// - `currentUser` síncrono é `null` (restauração ainda não terminou);
/// - `authStateChanges()` emite o usuário restaurado `A` após [emitDelay]
///   (dentro do timeout de segurança), simulando a conclusão assíncrona da
///   restauração da sessão persistida no IndexedDB. Ao emitir, `currentUser`
///   passa a refletir `A` (como o Firebase real faz);
/// - `signInAnonymously()` registra que foi chamado ([signInAnonymouslyCalled])
///   e retorna um usuário `B != A` (o UID volátil indevido).
class _FakeFirebaseAuth extends Fake implements FirebaseAuth {
  _FakeFirebaseAuth({
    required this.restoredUid,
    required this.newAnonymousUid,
    required this.emitDelay,
  });

  /// UID `A` da sessão anônima válida persistida (deve ser reutilizado).
  final String restoredUid;

  /// UID `B` que `signInAnonymously()` criaria (`B != A`).
  final String newAnonymousUid;

  /// Atraso até `authStateChanges()` emitir o usuário restaurado, simulando
  /// a restauração assíncrona (dentro do timeout de segurança).
  final Duration emitDelay;

  /// Flag da Property 1: registra se `signInAnonymously()` foi chamado.
  bool signInAnonymouslyCalled = false;

  User? _currentUser;

  @override
  User? get currentUser => _currentUser;

  @override
  Stream<User?> authStateChanges() async* {
    // Estado inicial: null (restauração ainda não resolvida).
    yield null;
    // A restauração assíncrona conclui após [emitDelay], emitindo o usuário
    // persistido A e atualizando `currentUser` (como o Firebase real).
    await Future<void>.delayed(emitDelay);
    _currentUser = _FakeUser(restoredUid);
    yield _currentUser;
  }

  @override
  Future<UserCredential> signInAnonymously() async {
    signInAnonymouslyCalled = true;
    _currentUser = _FakeUser(newAnonymousUid);
    return _FakeUserCredential(_currentUser);
  }
}

void main() {
  group('Property 1: Bug Condition — reutilizar sessão restaurada, não criar UID novo', () {
    // Scoped PBT: para o bug determinístico, escopamos a propriedade aos casos
    // concretos falhos (bug condition satisfeita) e variamos o UID persistido
    // `A` e o atraso de emissão de `authStateChanges` dentro do timeout de
    // segurança (~2–3s). Cada caso é um input do domínio da bug condition.
    const persistedUids = <String>[
      'anon-A-0001',
      'restored-uid-abc',
      'firebase-anon-XYZ-789',
      'sessao-persistida-42',
    ];
    const emitDelays = <Duration>[
      Duration.zero,
      Duration(milliseconds: 10),
      Duration(milliseconds: 100),
      Duration(milliseconds: 500),
    ];

    for (final restoredUid in persistedUids) {
      for (final emitDelay in emitDelays) {
        test(
          'sessão restaurável A="$restoredUid" (emissão em ${emitDelay.inMilliseconds}ms) '
          'deve ser reutilizada, sem chamar signInAnonymously',
          () async {
            // Bug condition: currentUser síncrono null, authStateChanges emitirá
            // A dentro do timeout, signInAnonymously retornaria B != A.
            final newAnonymousUid = 'novo-anonimo-B-$restoredUid';
            final auth = _FakeFirebaseAuth(
              restoredUid: restoredUid,
              newAnonymousUid: newAnonymousUid,
              emitDelay: emitDelay,
            );
            // Sanidade da bug condition: currentUser síncrono é null.
            expect(auth.currentUser, isNull,
                reason: 'bug condition exige currentUser síncrono null');

            final identity = FirebaseDeviceIdentity(auth: auth);

            final result = await identity.currentUserId();

            // Property 1 — Expected Behavior:
            expect(
              result,
              restoredUid,
              reason:
                  'deve reutilizar a sessão restaurada A ($restoredUid), não o UID novo B ($newAnonymousUid)',
            );
            expect(
              auth.signInAnonymouslyCalled,
              isFalse,
              reason:
                  'signInAnonymously() NÃO pode ser chamado quando há sessão anônima persistida restaurável',
            );
          },
        );
      }
    }
  });
}
