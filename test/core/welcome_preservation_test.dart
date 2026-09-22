import 'package:flutter_test/flutter_test.dart';

import 'package:debuga_o_mascote/core/progress/progress_state.dart';
import 'package:debuga_o_mascote/models/progress.dart';

import '../helpers/welcome_seams.dart';

/// Testes de **Preservação** (Property 2 do design `boas-vindas-primeira-vez`,
/// issue #3).
///
/// **Metodologia observation-first**: estes testes fixam o comportamento
/// OBSERVADO de `F` (código NÃO corrigido) para todos os inputs FORA da bug
/// condition (`isBugCondition(X) == false`). Eles DEVEM PASSAR em `F` — capturam
/// a baseline que não pode regredir. São reutilizados **inalterados** na tarefa
/// 3.7 para confirmar que `F'` produz o mesmo resultado observável (não escrever
/// testes novos lá).
///
/// Comportamento observado de `F` (decisão da Splash em `splash_view.dart`):
///   1. **Primeira vez de verdade** (local `false` E sincronizado `false`) →
///      `F` mostra a `WelcomeView`.
///   2. **`seenWelcome` local já `true`** → `F` vai direto pra Seleção de Mundo
///      (sem `WelcomeView`).
///   3. **Fluxo anônimo** — concluir a `WelcomeView` por "Jogar sem conta" →
///      `F` finaliza marcando o(s) estado(s), sem quebrar o modo anônimo.
///   4. **`mergedWith` preserva progresso** — mesclar dois estados com progresso
///      em lados diferentes → progresso preservado em ambos, nunca regride
///      `true → false`.
///
/// Bug Condition (do design/bugfix.md), que estes testes evitam:
///   platform = WEB
///   AND accountHasSeenWelcomeBefore = true   // conta/UID já viu antes (sincronizado)
///   AND localSeenWelcomePersisted = false     // storage local perdido/limpo/indisponível
///   AND seenWelcomeTiedToAccount = false        // hoje não é sincronizado por conta
///
/// > **Nota de ordenação de tarefa (3.1)**: o campo sincronizado
/// > `ProgressState.seenWelcome` **ainda não existe** nesta etapa (é adicionado
/// > na tarefa 3.1). Por isso a propriedade `mergedWith(a,b).seenWelcome ==
/// > (a.seenWelcome || b.seenWelcome)` ainda não pode ser asserida sem quebrar a
/// > compilação. Seguindo os seams da Task 0, aqui:
/// > - a decisão da Splash modela o sincronizado como um `bool` cru
/// >   (`syncedSeenWelcome`), consistente com [shouldShowWelcome];
/// > - o `mergedWith` é testado agora pela **preservação de progresso** (3.6),
/// >   que é o comportamento-base real que não pode regredir;
/// > - a asserção do OR de `seenWelcome` fica marcada como TODO(3.1), a ser
/// >   habilitada quando o campo existir (sem alterar produção nesta tarefa).

void main() {
  group('Property 2: Preservation — inputs não-buggy inalterados', () {
    // ── Decisão da Splash: WelcomeView só quando !(local || sincronizado) ──
    //
    // Para inputs FORA da bug condition, `decideWelcome'(X) == decideWelcome(X)`.
    // Aqui `F` = decisão original (só local, [shouldShowWelcomeLocalOnly]) e
    // `F'` = decisão corrigida (local OR sincronizado, [shouldShowWelcome]).
    //
    // Domínio: todas as combinações de (localSeenWelcome, syncedSeenWelcome,
    // platform) EXCETO a buggy (web, local false, sincronizado/conta true).

    group('Decisão da Splash — F e F\' concordam fora da bug condition', () {
      /// Um input da decisão de boas-vindas, escopado ao que a Splash observa.
      /// `platform` é incluído para varrer web/nativo; a decisão em si não
      /// depende dele (é o mesmo código), mas varrê-lo documenta que o
      /// comportamento é idêntico nas duas plataformas fora da bug condition.
      const localValues = <bool>[false, true];
      const syncedValues = <bool>[false, true];
      const platforms = <String>['web', 'native'];

      for (final platform in platforms) {
        for (final local in localValues) {
          for (final synced in syncedValues) {
            // Domínio de PRESERVAÇÃO = inputs onde `F` e `F'` DEVEM coincidir.
            //
            // A combinação (local=false, synced=true) é exatamente onde o fix
            // MUDA a decisão de propósito: `F` (só local) mostra a WelcomeView,
            // `F'` (local OR sincronizado) vai direto pra Seleção de Mundo. É a
            // essência da correção — o "conta já viu antes" chega pela fonte
            // sincronizada. Na web isso É a bug condition formal
            // (`isBugCondition`, platform=WEB); no nativo é o mesmo delta de
            // comportamento observável (storage local durável costuma não zerar,
            // mas se `local=false` e a conta já viu, F' também reconhece via
            // sincronizado). Em ambos os casos, F != F' por design — logo esse
            // input NÃO pertence ao domínio de preservação e é pulado aqui.
            // (O comportamento sob web+esse input é coberto pela Property 1 /
            // welcome_bug_condition_test.dart.)
            final syncedChangesDecision = local == false && synced == true;
            if (syncedChangesDecision) continue;

            test(
              'platform=$platform local=$local synced=$synced → F == F\'',
              () {
                // `F` — decisão original: lê SÓ o local (splash_view.dart atual).
                final fDecision = shouldShowWelcomeLocalOnly(localSeenWelcome: local);

                // `F'` — decisão corrigida: local OR sincronizado.
                final fPrimeDecision = shouldShowWelcome(
                  localSeenWelcome: local,
                  syncedSeenWelcome: synced,
                );

                // Preservation Checking: fora da bug condition, os dois
                // produzem o MESMO resultado observável.
                expect(
                  fPrimeDecision,
                  fDecision,
                  reason: 'fora da bug condition, decideWelcome\'(X) deve igualar '
                      'decideWelcome(X) (platform=$platform, local=$local, synced=$synced)',
                );
              },
            );
          }
        }
      }
    });

    group('Decisão da Splash — casos-âncora concretos (Testing Strategy)', () {
      test('primeira vez de verdade (local false, sincronizado false) → mostra WelcomeView', () {
        // Caso 1 do design: nem local nem sincronizado → primeira vez real.
        expect(
          shouldShowWelcomeLocalOnly(localSeenWelcome: false),
          WelcomeDecision.showWelcome,
          reason: 'F mostra a WelcomeView na primeira vez',
        );
        expect(
          shouldShowWelcome(localSeenWelcome: false, syncedSeenWelcome: false),
          WelcomeDecision.showWelcome,
          reason: 'F\' também mostra — comportamento preservado (3.1)',
        );
      });

      test('seenWelcome local já true → vai direto pra Seleção de Mundo (sem WelcomeView)', () {
        // Caso 2 do design: local durável já true (ex.: nativo).
        expect(
          shouldShowWelcomeLocalOnly(localSeenWelcome: true),
          WelcomeDecision.goToWorldSelect,
          reason: 'F pula a WelcomeView quando o local já viu',
        );
        expect(
          shouldShowWelcome(localSeenWelcome: true, syncedSeenWelcome: false),
          WelcomeDecision.goToWorldSelect,
          reason: 'F\' preserva o atalho direto quando já visto (3.3)',
        );
        // Também com o sincronizado true: continua indo direto (não é bug).
        expect(
          shouldShowWelcome(localSeenWelcome: true, syncedSeenWelcome: true),
          WelcomeDecision.goToWorldSelect,
        );
      });

      test('degradação segura — sem sincronizado hidratado, recai no local (3.4)', () {
        // Edge do design: sem internet/Firebase off → syncedSeenWelcome false.
        // A decisão recai exatamente no comportamento local atual.
        expect(
          shouldShowWelcome(localSeenWelcome: true, syncedSeenWelcome: false),
          shouldShowWelcomeLocalOnly(localSeenWelcome: true),
        );
        expect(
          shouldShowWelcome(localSeenWelcome: false, syncedSeenWelcome: false),
          shouldShowWelcomeLocalOnly(localSeenWelcome: false),
        );
      });
    });

    group('Fluxo anônimo — concluir a WelcomeView por "Jogar sem conta" (3.2)', () {
      // Caso 3 do design: concluir por "Jogar sem conta" finaliza sem quebrar o
      // modo anônimo. O ponto único é `WelcomeView._finish`, que hoje marca o
      // local (`OnboardingNotifier.markWelcomeSeen`). Observação-first: após
      // concluir, o estado local vira "já viu" e a próxima decisão da Splash vai
      // direto pra Seleção de Mundo — sem exigir conta, preservando o anônimo.
      test('após concluir, o local vira "já viu" e a Splash não reexibe (F e F\')', () {
        // Antes de concluir: primeira vez → mostra a WelcomeView.
        expect(
          shouldShowWelcomeLocalOnly(localSeenWelcome: false),
          WelcomeDecision.showWelcome,
        );

        // "Jogar sem conta" chama `_finish` → marca o local (sem criar conta).
        // Modelamos o efeito observável: o local passa a `true`.
        const localAfterFinish = true;

        // Depois de concluir: F vai direto pra Seleção de Mundo.
        expect(
          shouldShowWelcomeLocalOnly(localSeenWelcome: localAfterFinish),
          WelcomeDecision.goToWorldSelect,
          reason: 'concluir por "Jogar sem conta" marca o local e não reexibe (F)',
        );
        // F' preserva: sem sincronizado (anônimo/sem conta), recai no local.
        expect(
          shouldShowWelcome(localSeenWelcome: localAfterFinish, syncedSeenWelcome: false),
          WelcomeDecision.goToWorldSelect,
          reason: 'F\' preserva o fluxo anônimo — decisão idêntica a F (3.2)',
        );
      });
    });

    group('mergedWith preserva progresso — nada descartado (3.6)', () {
      // Caso 4 do design: mesclar dois estados com progresso em lados diferentes
      // → progresso preservado em ambos os lados, nunca regride `true → false`.
      // Este é o comportamento-base atual do `mergedWith` que o fix (3.1) NÃO
      // pode quebrar ao adicionar o OR de `seenWelcome`.

      test('progresso de fases em lados diferentes é preservado nos dois sentidos', () {
        const local = ProgressState(
          byLevelId: {
            'fase1': LevelProgress(stars: 3, bestBlocks: 2, bestPoints: 300),
          },
        );
        const fromAccount = ProgressState(
          byLevelId: {
            'fase2': LevelProgress(stars: 2, bestBlocks: 5, bestPoints: 150),
          },
        );

        final merged = local.mergedWith(fromAccount);

        // Nenhum lado descartado.
        expect(merged.isCompleted('fase1'), isTrue, reason: 'progresso local preservado');
        expect(merged.isCompleted('fase2'), isTrue, reason: 'progresso da conta preservado');
        expect(merged.forLevel('fase1')!.bestPoints, 300);
        expect(merged.forLevel('fase2')!.bestPoints, 150);

        // Comutatividade da união de fases: o outro sentido também preserva os dois.
        final mergedOther = fromAccount.mergedWith(local);
        expect(mergedOther.isCompleted('fase1'), isTrue);
        expect(mergedOther.isCompleted('fase2'), isTrue);
      });

      test('flags booleanas nunca regridem true → false (OR), progresso não é perdido', () {
        // PBT escopado sobre as flags OR já existentes (mesmo espírito do OR de
        // `seenWelcome` que 3.1 vai adicionar): para todas as combinações de
        // (hasSubmittedToLeaderboard, gameCompleted) nos dois lados, o merge é o
        // OR lógico — nunca perde um `true`.
        const bools = <bool>[false, true];
        for (final aSubmitted in bools) {
          for (final bSubmitted in bools) {
            for (final aCompleted in bools) {
              for (final bCompleted in bools) {
                final a = ProgressState(
                  hasSubmittedToLeaderboard: aSubmitted,
                  gameCompleted: aCompleted,
                );
                final b = ProgressState(
                  hasSubmittedToLeaderboard: bSubmitted,
                  gameCompleted: bCompleted,
                );

                final merged = a.mergedWith(b);

                expect(
                  merged.hasSubmittedToLeaderboard,
                  aSubmitted || bSubmitted,
                  reason: 'hasSubmittedToLeaderboard mescla por OR (nunca regride true→false)',
                );
                expect(
                  merged.gameCompleted,
                  aCompleted || bCompleted,
                  reason: 'gameCompleted mescla por OR (nunca regride true→false)',
                );

                // Habilitado na tarefa 3.1 (campo `ProgressState.seenWelcome`
                // já existe): propriedade do design — `seenWelcome` mescla por
                // OR, nunca regride `true → false`.
                for (final aSeen in bools) {
                  for (final bSeen in bools) {
                    final aw = a.copyWith(seenWelcome: aSeen);
                    final bw = b.copyWith(seenWelcome: bSeen);
                    expect(
                      aw.mergedWith(bw).seenWelcome,
                      aSeen || bSeen,
                      reason: 'seenWelcome mescla por OR (nunca regride true→false)',
                    );
                  }
                }
              }
            }
          }
        }
      });

      test('melhor resultado por fase preservado quando a mesma fase existe nos dois lados', () {
        const local = ProgressState(
          byLevelId: {'fase1': LevelProgress(stars: 1, bestBlocks: 9, bestPoints: 100)},
        );
        const fromAccount = ProgressState(
          byLevelId: {'fase1': LevelProgress(stars: 3, bestBlocks: 4, bestPoints: 250)},
        );

        final merged = local.mergedWith(fromAccount);

        // Melhor de cada métrica: mais estrelas, menos blocos, mais pontos.
        expect(merged.forLevel('fase1')!.stars, 3);
        expect(merged.forLevel('fase1')!.bestBlocks, 4);
        expect(merged.forLevel('fase1')!.bestPoints, 250);
      });
    });
  });
}
