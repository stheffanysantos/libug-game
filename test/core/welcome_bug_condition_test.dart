import 'package:flutter_test/flutter_test.dart';

import '../helpers/welcome_seams.dart';

/// Teste da **Bug Condition / Fix Checking** (Property 1 do design
/// `boas-vindas-primeira-vez`, issue #3).
///
/// **Ciclo de bugfix**: na tarefa 1 este teste FALHOU no código NÃO corrigido
/// (`F`), exercitando o seam local-only [shouldShowWelcomeLocalOnly] — a falha
/// CONFIRMOU o bug. Na tarefa 3.6, com o fix aplicado (Splash decide por
/// `local OR sincronizado`, tarefa 3.5), o MESMO teste é reexecutado exercendo
/// o seam FIXO [shouldShowWelcome] — agora ele PASSA, confirmando o fix.
///
/// Sob a bug condition (web, `seenWelcome` local perdido/`false`, e a conta/UID
/// já viu as boas-vindas antes — registrado no estado sincronizado por conta no
/// Firestore), a decisão corrigida da Splash (`F'`) considera **ambas** as
/// fontes (`ref.read(onboardingProvider).seenWelcome ||
/// ref.read(progressProvider).seenWelcome`, espelhado aqui por
/// [shouldShowWelcome]). Como a conta já viu (sincronizado), a decisão vai
/// direto pra Seleção de Mundo mesmo com o local perdido.
///
/// Bug Condition (do design/bugfix.md):
///   platform = WEB
///   AND accountHasSeenWelcomeBefore = true   // conta/UID já viu antes (sincronizado)
///   AND localSeenWelcomePersisted = false     // storage local perdido/limpo/indisponível
///   AND seenWelcomeTiedToAccount = false        // hoje não é sincronizado por conta
///
/// Asserção (Property 1 — Expected Behavior):
///   decisão == GO_TO_WORLD_SELECT (não exibir a WelcomeView),
///   porque "boas-vindas vistas" deve ser `local OR sincronizado`.
///
/// **NOTA**: este é o MESMO teste da tarefa 1 (não é um teste novo). A única
/// mudança para a tarefa 3.6 é trocar o seam local-only (`F`) pelo seam
/// `local OR sincronizado` (`F'`), passando o "já viu" sincronizado da conta —
/// exatamente o que "verificar o fix" significa. A asserção
/// (`goToWorldSelect`) e os 3 casos concretos permanecem inalterados.

/// Contexto de decisão da bug condition — modela `WelcomeDecisionContext` do
/// design, escopado aos campos que a decisão da Splash observa. Todos os casos
/// aqui satisfazem `isBugCondition(X) == true`.
class _BugContext {
  const _BugContext({
    required this.label,
    required this.accountHasSeenWelcomeBefore,
    required this.localSeenWelcomePersisted,
  });

  /// Descrição do cenário concreto (para o nome do teste / counterexample).
  final String label;

  /// A conta/UID já viu as boas-vindas antes (registrado no estado sincronizado
  /// por conta no Firestore). Na bug condition, sempre `true`.
  final bool accountHasSeenWelcomeBefore;

  /// O `seenWelcome` local (`shared_preferences`) sobreviveu? Na bug condition,
  /// sempre `false` (storage limpo/indisponível na web).
  final bool localSeenWelcomePersisted;

  /// Sanidade: `platform = WEB`, conta já viu, local perdido, não atrelado à
  /// conta na decisão original (`F` só lê o local).
  bool get isBugCondition =>
      accountHasSeenWelcomeBefore == true && localSeenWelcomePersisted == false;
}

void main() {
  group('Property 1: Bug Condition — não reexibir boas-vindas para conta que já viu', () {
    // Scoped PBT: para o bug determinístico, escopamos a propriedade aos casos
    // concretos falhos (bug condition satisfeita). Cada caso é um input do
    // domínio da bug condition (plataforma WEB, conta já viu antes via estado
    // sincronizado, `seenWelcome` local perdido/`false`). Os três cenários vêm
    // direto da Testing Strategy do design.
    const contexts = <_BugContext>[
      _BugContext(
        label: 'storage local limpo, conta A já viu antes (remoto "já viu")',
        accountHasSeenWelcomeBefore: true,
        localSeenWelcomePersisted: false,
      ),
      _BugContext(
        label: 'outro navegador, mesma conta (sem shared_preferences do 1º acesso)',
        accountHasSeenWelcomeBefore: true,
        localSeenWelcomePersisted: false,
      ),
      _BugContext(
        label: 'entra/sai repetido na web (cada entrada com local false)',
        accountHasSeenWelcomeBefore: true,
        localSeenWelcomePersisted: false,
      ),
    ];

    for (final ctx in contexts) {
      test(
        'WEB — ${ctx.label} → deve ir direto pra Seleção de Mundo (sem WelcomeView)',
        () {
          // Sanidade: o input pertence ao domínio da bug condition.
          expect(
            ctx.isBugCondition,
            isTrue,
            reason: 'pré-condição: este caso deve satisfazer isBugCondition(X)',
          );

          // A conta já viu → o estado sincronizado por conta (Firestore) diz
          // "já viu". Mas o `seenWelcome` local foi perdido (web, storage
          // volátil).
          final localSeenWelcome = ctx.localSeenWelcomePersisted; // false
          // O sinal "já viu antes" da conta vem do estado sincronizado por
          // conta (Firestore). Na bug condition isto é `true`.
          final syncedSeenWelcome = ctx.accountHasSeenWelcomeBefore; // true

          // `F'` — decisão do código CORRIGIDO: a Splash decide por
          // `local OR sincronizado` (`splash_view.dart` após a tarefa 3.5),
          // considerando a fonte sincronizada por conta. Reusamos o MESMO teste
          // da tarefa 1, agora exercitando o seam FIXO [shouldShowWelcome] com
          // o "já viu" sincronizado da conta — em vez do seam local-only (`F`)
          // que originalmente falhava.
          final decision = shouldShowWelcome(
            localSeenWelcome: localSeenWelcome, // false (storage local perdido)
            syncedSeenWelcome: syncedSeenWelcome, // true (conta já viu, sincronizado)
          );

          // Property 1 — Expected Behavior: como a conta já viu (sincronizado),
          // a decisão correta é ir direto pra Seleção de Mundo, sem reexibir a
          // WelcomeView. Este teste PASSA no código corrigido (`F'` decide
          // `goToWorldSelect`), o que CONFIRMA que o bug foi corrigido.
          expect(
            decision,
            WelcomeDecision.goToWorldSelect,
            reason:
                'conta já viu (estado sincronizado por conta = true); a decisão '
                'corrigida (`local OR sincronizado`) deve ir direto pra Seleção de '
                'Mundo mesmo com o `seenWelcome` local perdido. '
                'Counterexample (código não corrigido): ${ctx.label} → mostrava '
                'WelcomeView em vez de ir pra Seleção de Mundo.',
          );
        },
      );
    }
  });
}
