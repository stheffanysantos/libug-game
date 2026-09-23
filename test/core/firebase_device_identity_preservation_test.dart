import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:debuga_o_mascote/core/firebase_device_identity.dart';

/// Testes de **Preservação** (Property 2 do design `sessao-anonima-estavel`).
///
/// **Metodologia observation-first**: estes testes fixam o comportamento
/// OBSERVADO de `F` (código NÃO corrigido) para todos os inputs FORA da bug
/// condition (`isBugCondition == false`). Eles DEVEM PASSAR em `F` — capturam
/// a baseline que não pode regredir. São reutilizados na tarefa 4.3 para
/// confirmar que `F'` produz o mesmo resultado observável (não escrever testes
/// novos lá).
///
/// Comportamento observado de `F`:
///   1. Se `currentUser != null` síncrono → retorna `uid` imediatamente,
///      SEM tocar em `authStateChanges()`/`signInAnonymously()` (preserva 3.1).
///   2. Se `currentUser == null` síncrono → chama `signInAnonymously()` e
///      retorna o UID criado (2.3 — primeira execução real).
///   3. Se `currentUser`/`signInAnonymously()` lançam → retorna `null`, sem
///      propagar exceção (preserva 2.4/3.5).
///   4. Timeout / restauração que não conclui: como `F` NÃO tem lógica de
///      espera, quando `currentUser` síncrono é `null` ele cai direto em
///      `signInAnonymously()` — ou seja, degrada para a criação de anônimo sem
///      travar nem lançar (2.3). O teste assere esse comportamento observado
///      de `F`, que permanece semântica válida para `F'` (fallback a
///      signInAnonymously quando a restauração não conclui).
///
/// Nenhum destes cenários satisfaz a bug condition:
///   platform=WEB AND authRestoreCompleted=false AND currentUserSync=null
///   AND persistedAnonymousSessionExists=true.

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
/// Configurável para modelar cada cenário de preservação:
/// - [initialUser]: valor síncrono de `currentUser` no início.
/// - [newAnonymousUid]: UID que `signInAnonymously()` cria (quando aplicável).
/// - [throwOnCurrentUser]: se `true`, ler `currentUser` lança (indisponível).
/// - [throwOnSignIn]: se `true`, `signInAnonymously()` lança.
/// - `authStateChanges()` retorna um stream que NÃO emite (restauração que não
///   conclui). Isto reflete o cenário de timeout: `F` nunca subscreve este
///   stream — sempre cai em `signInAnonymously()` quando `currentUser` síncrono
///   é `null` — de modo que a ausência de emissão fixa exatamente a baseline
///   observada de `F` para o caso de restauração que não conclui a tempo.
/// - Flags de observação: [signInAnonymouslyCalled], [authStateChangesAccessed].
class _FakeFirebaseAuth extends Fake implements FirebaseAuth {
  _FakeFirebaseAuth({
    User? initialUser,
    this.newAnonymousUid,
    this.throwOnCurrentUser = false,
    this.throwOnSignIn = false,
  }) : _currentUser = initialUser;

  final String? newAnonymousUid;
  final bool throwOnCurrentUser;
  final bool throwOnSignIn;

  /// Registra se `signInAnonymously()` foi chamado.
  bool signInAnonymouslyCalled = false;

  /// Registra se `authStateChanges()` foi acessado — o atalho síncrono NÃO
  /// deve tocar nisso.
  bool authStateChangesAccessed = false;

  User? _currentUser;

  @override
  User? get currentUser {
    if (throwOnCurrentUser) {
      throw StateError('Firebase indisponível ao ler currentUser');
    }
    return _currentUser;
  }

  @override
  Stream<User?> authStateChanges() {
    authStateChangesAccessed = true;
    // Restauração que não conclui: stream que nunca emite. Observação-first:
    // `F` nunca subscreve este stream, então isto não altera o comportamento
    // de `F`; fixa a baseline do cenário de timeout (degrada a signInAnonymously).
    return StreamController<User?>().stream;
  }

  @override
  Future<UserCredential> signInAnonymously() async {
    signInAnonymouslyCalled = true;
    if (throwOnSignIn) {
      throw FirebaseAuthException(code: 'network-request-failed');
    }
    _currentUser = newAnonymousUid == null ? null : _FakeUser(newAnonymousUid!);
    return _FakeUserCredential(_currentUser);
  }
}

void main() {
  group('Property 2: Preservation — inputs não-buggy inalterados', () {
    group('Atalho síncrono (currentUser != null) — preserva 3.1', () {
      // PBT escopado: varia o UID já disponível de forma síncrona.
      const syncUids = <String>[
        'user-conta-logada-1',
        'anon-restaurado-em-memoria',
        'conta-google-XYZ',
        'uid-42',
      ];

      for (final uid in syncUids) {
        test(
          'currentUser="$uid" disponível → retorna imediatamente, '
          'sem tocar authStateChanges/signInAnonymously',
          () async {
            final auth = _FakeFirebaseAuth(initialUser: _FakeUser(uid));
            final identity = FirebaseDeviceIdentity(auth: auth);

            final result = await identity.currentUserId();

            expect(result, uid,
                reason: 'atalho síncrono deve retornar currentUser.uid');
            expect(auth.signInAnonymouslyCalled, isFalse,
                reason: 'não pode criar anônimo quando já há usuário');
            expect(auth.authStateChangesAccessed, isFalse,
                reason: 'atalho síncrono não deve tocar authStateChanges');
          },
        );
      }
    });

    group('Primeira execução real (currentUser == null, sem sessão) — 2.3', () {
      // Fora da bug condition: NÃO há sessão persistida restaurável, então
      // criar um anônimo é o comportamento correto de primeira execução.
      const createdUids = <String>[
        'primeiro-anonimo-A',
        'novo-uid-boot-inicial',
        'anon-first-run-999',
      ];

      for (final createdUid in createdUids) {
        test(
          'sem usuário e sem sessão → cria anônimo e retorna "$createdUid"',
          () async {
            final auth = _FakeFirebaseAuth(newAnonymousUid: createdUid);
            expect(auth.currentUser, isNull);

            final identity = FirebaseDeviceIdentity(auth: auth);

            final result = await identity.currentUserId();

            expect(result, createdUid,
                reason: 'primeira execução deve criar e retornar o novo UID');
            expect(auth.signInAnonymouslyCalled, isTrue,
                reason: 'signInAnonymously deve ser chamado na primeira execução');
          },
        );
      }
    });

    group('Erro / indisponibilidade → retorna null sem lançar — 2.4/3.5', () {
      test('ler currentUser lança → retorna null, não propaga', () async {
        final auth = _FakeFirebaseAuth(throwOnCurrentUser: true);
        final identity = FirebaseDeviceIdentity(auth: auth);

        final result = await identity.currentUserId();

        expect(result, isNull,
            reason: 'falha ao ler currentUser deve virar null, não exceção');
      });

      test('signInAnonymously lança → retorna null, não propaga', () async {
        final auth = _FakeFirebaseAuth(throwOnSignIn: true);
        expect(auth.currentUser, isNull);
        final identity = FirebaseDeviceIdentity(auth: auth);

        final result = await identity.currentUserId();

        expect(result, isNull,
            reason: 'falha em signInAnonymously deve virar null, não exceção');
        expect(auth.signInAnonymouslyCalled, isTrue,
            reason: 'tentou criar anônimo antes de falhar');
      });
    });

    group('Timeout / restauração que não conclui → degrada a signInAnonymously '
        'sem travar nem lançar — 2.3', () {
      // Observation-first: em `F` não existe lógica de espera; com currentUser
      // síncrono null, `F` cai direto em signInAnonymously e retorna o UID
      // criado, sem travar nem lançar. Este é o comportamento observado que o
      // teste fixa (e permanece semântica válida para `F'`: fallback quando a
      // restauração não conclui a tempo).
      test(
        'restauração não emite a tempo → retorna o UID de signInAnonymously '
        'sem travar/lançar',
        () async {
          final auth = _FakeFirebaseAuth(
            newAnonymousUid: 'anonimo-apos-timeout',
          );
          expect(auth.currentUser, isNull);
          final identity = FirebaseDeviceIdentity(auth: auth);

          final result = await identity
              .currentUserId()
              .timeout(const Duration(seconds: 10));

          expect(result, 'anonimo-apos-timeout',
              reason: 'sem restauração a tempo, degrada para signInAnonymously');
          expect(auth.signInAnonymouslyCalled, isTrue,
              reason: 'fallback deve criar anônimo quando não há restauração');
        },
      );
    });
  });
}
