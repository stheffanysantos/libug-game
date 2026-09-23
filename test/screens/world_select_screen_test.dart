import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/misc.dart' show Override;
import 'package:flutter_test/flutter_test.dart';

import 'package:debuga_o_mascote/core/onboarding/onboarding_notifier.dart';
import 'package:debuga_o_mascote/core/progress/progress_notifier.dart';
import 'package:debuga_o_mascote/features/code_quest/presentation/stage_select/stage_select_view.dart';
import 'package:debuga_o_mascote/features/code_puzzle/presentation/stage_select/stage_select_view.dart';
import 'package:debuga_o_mascote/features/complete_code/presentation/stage_select/stage_select_view.dart';
import 'package:debuga_o_mascote/features/maze/presentation/stage_select/stage_select_view.dart';
import 'package:debuga_o_mascote/features/predict_output/presentation/stage_select/stage_select_view.dart';
import 'package:debuga_o_mascote/models/level.dart';
import 'package:debuga_o_mascote/features/world_select/presentation/world_select_view.dart';

import '../helpers/test_container.dart';

/// Ver `.claude/plans/Mundos.md` (Etapa 1) e
/// `.claude/docs/NAVIGATION_FLOW.md`. Mesmo estilo de interação real usado
/// em `test/screens/gameplay_flow_test.dart` — sem mock.
///
/// Estes testes cobrem a Seleção de Mundo em si (grade compacta, navegação
/// por `GameWorld`). O fluxo do `TutorialModal` na 1ª vez que um mundo é
/// tocado (ver `Onboarding`, `lib/core/onboarding/`) tem seus próprios
/// testes em `test/screens/tutorial_flow_test.dart` — aqui, cada mundo
/// tocado já é marcado como visto de antemão (`onboardingProvider.notifier.markSeen`)
/// para testar só a navegação, sem o modal no meio do caminho.
void main() {
  // O mapa (`_WorldMapPath`) é mais alto que qualquer viewport de celular
  // (3 nós grandes, ver `.claude/memory/decisions.md`) — rola de verdade
  // dentro do `SingleChildScrollView` da tela. `ensureVisible` (chamado antes
  // de cada `tap` abaixo) rola até o nó certo em vez de depender de uma
  // superfície de teste grande o bastante pra caber tudo sem rolagem.
  //
  // `completeAll` (padrão) vence todas as fases de todos os mundos antes de
  // abrir a tela, para os testes de navegação não dependerem da trava de
  // desbloqueio. Os testes da trava passam `completeAll: false`.
  Future<ProviderContainer> pumpWorldSelect(WidgetTester tester, {List<Override> overrides = const [], bool completeAll = true}) async {
    await tester.binding.setSurfaceSize(const Size(400, 900));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    final container = createTestContainer(overrides: overrides);
    if (completeAll) {
      final progress = container.read(progressProvider.notifier);
      for (final world in worlds) {
        for (final level in world.levels) {
          progress.recordWin(level.id, stars: 3, blocksUsed: 1, points: 300);
        }
      }
    }
    await tester.pumpWidget(wrapForTest(container, const WorldSelectView()));
    await tester.pump();
    return container;
  }

  testWidgets('mostra os 7 mundos com nome', (tester) async {
    await pumpWorldSelect(tester);

    for (final world in worlds) {
      final node = find.text('MUNDO ${world.number} / ${world.name.toUpperCase()}');
      await tester.ensureVisible(node);
      await tester.pump();
      expect(node, findsOneWidget);
    }
  });

  testWidgets('nenhum mundo aparece "EM BREVE" — as três trilhas já têm mundos de verdade', (tester) async {
    await pumpWorldSelect(tester);

    // Trilha 1 (Mundos 1-2), Trilha 2 (Mundos 3-4) e Trilha 3 (Mundos 5-7)
    // têm conteúdo real — nenhum badge "EM BREVE" na tela. Mundos além do
    // 1º de cada trilha ficam bloqueados por progresso, não "comingSoon".
    expect(find.text('EM BREVE'), findsNothing);
    expect(find.textContaining('TRILHA 2'), findsOneWidget);
    expect(find.textContaining('TRILHA 3'), findsOneWidget);
  });

  testWidgets('tocar o card do Mundo 2 (já visto) navega direto para a Seleção de Fases da Encruzilhada Colorida', (tester) async {
    final container = await pumpWorldSelect(tester);
    container.read(onboardingProvider.notifier).markSeen(worlds[1].number);
    await tester.pump();

    // Não usar pumpAndSettle: o card jogável usa PulseTap, uma animação em
    // loop infinito, que nunca "assenta" (ver `.claude/rules/testing.md`).
    final node = find.text('MUNDO 2 / ${worlds[1].name.toUpperCase()}');
    await tester.ensureVisible(node);
    await tester.pump();
    await tester.tap(node);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.byType(StageSelectView), findsOneWidget);
    expect(find.text('MUNDO 2'), findsOneWidget);
  });

  testWidgets('tocar o card do Mundo 3 (já visto) navega direto para a Seleção de Fases do Caça-Moedas', (tester) async {
    final container = await pumpWorldSelect(tester);
    container.read(onboardingProvider.notifier).markSeen(worlds[2].number);
    await tester.pump();

    final node = find.text('MUNDO 3 / ${worlds[2].name.toUpperCase()}');
    await tester.ensureVisible(node);
    await tester.pump();
    await tester.tap(node);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.byType(StageSelectView), findsOneWidget);
    expect(find.text('MUNDO 3'), findsOneWidget);
  });

  testWidgets('tocar o card do Mundo 4 (já visto) navega direto para a Seleção de Fases de Missão de Código', (tester) async {
    final container = await pumpWorldSelect(tester);
    container.read(onboardingProvider.notifier).markSeen(worlds[3].number);
    await tester.pump();

    final node = find.text('MUNDO 4 / ${worlds[3].name.toUpperCase()}');
    await tester.ensureVisible(node);
    await tester.pump();
    await tester.tap(node);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.byType(CodeQuestStageSelectView), findsOneWidget);
    expect(find.text('MUNDO 4'), findsOneWidget);
  });

  testWidgets('tocar o card do Mundo 5 (já visto) navega direto para a Seleção de Fases de Preveja a Saída', (tester) async {
    final container = await pumpWorldSelect(tester);
    container.read(onboardingProvider.notifier).markSeen(worlds[4].number);
    await tester.pump();

    final node = find.text('MUNDO 5 / ${worlds[4].name.toUpperCase()}');
    await tester.ensureVisible(node);
    await tester.pump();
    await tester.tap(node);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.byType(PredictOutputStageSelectView), findsOneWidget);
    expect(find.text('MUNDO 5'), findsOneWidget);
  });

  testWidgets('tocar o card do Mundo 6 (já visto) navega direto para a Seleção de Fases de Complete o Código', (tester) async {
    final container = await pumpWorldSelect(tester);
    container.read(onboardingProvider.notifier).markSeen(worlds[5].number);
    await tester.pump();

    final node = find.text('MUNDO 6 / ${worlds[5].name.toUpperCase()}');
    await tester.ensureVisible(node);
    await tester.pump();
    await tester.tap(node);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.byType(CompleteCodeStageSelectView), findsOneWidget);
    expect(find.text('MUNDO 6'), findsOneWidget);
  });

  testWidgets('tocar o card do Mundo 7 (já visto) navega direto para a Seleção de Fases do Modo Debug', (tester) async {
    final container = await pumpWorldSelect(tester);
    container.read(onboardingProvider.notifier).markSeen(worlds[6].number);
    await tester.pump();

    final node = find.text('MUNDO 7 / ${worlds[6].name.toUpperCase()}');
    await tester.ensureVisible(node);
    await tester.pump();
    await tester.tap(node);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.byType(CodePuzzleStageSelectView), findsOneWidget);
    expect(find.text('MUNDO 7'), findsOneWidget);
  });

  testWidgets('tocar o card do Mundo 1 (já visto) navega direto para a Seleção de Fases', (tester) async {
    final container = await pumpWorldSelect(tester);
    container.read(onboardingProvider.notifier).markSeen(worlds.first.number);
    await tester.pump();

    // Não usar pumpAndSettle: o card jogável usa PulseTap, uma animação em
    // loop infinito, que nunca "assenta" (ver `.claude/rules/testing.md` e
    // o mesmo padrão em `test/screens/gameplay_flow_test.dart`).
    final node = find.text('MUNDO 1 / ${worlds.first.name.toUpperCase()}');
    await tester.ensureVisible(node);
    await tester.pump();
    await tester.tap(node);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.byType(StageSelectView), findsOneWidget);
    expect(find.text('MUNDO 1'), findsOneWidget);
  });

  // Trava de desbloqueio ativa em produção (`_debugUnlockAllWorlds = false`).
  group('trava de desbloqueio', () {
    Future<void> tapWorld(WidgetTester tester, int index) async {
      final node = find.text('MUNDO ${worlds[index].number} / ${worlds[index].name.toUpperCase()}');
      await tester.ensureVisible(node);
      await tester.pump();
      await tester.tap(node);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));
    }

    testWidgets('jogador novo: Mundo 1 abre, Mundo 2 fica bloqueado com aviso', (tester) async {
      final container = await pumpWorldSelect(tester, completeAll: false);
      container.read(onboardingProvider.notifier).markSeen(worlds[0].number);
      container.read(onboardingProvider.notifier).markSeen(worlds[1].number);
      await tester.pump();

      await tapWorld(tester, 1);
      expect(find.byType(StageSelectView), findsNothing);
      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets('Mundo 2 abre com 60% dos pontos possíveis do Mundo 1', (tester) async {
      final container = await pumpWorldSelect(tester, completeAll: false);
      container.read(onboardingProvider.notifier).markSeen(worlds[1].number);
      final progress = container.read(progressProvider.notifier);
      // 12 fases × 300 = 3600 possíveis; 60% = 2160, ou seja, 8 fases com 300 (2400).
      for (final level in world1Levels.take(8)) {
        progress.recordWin(level.id, stars: 3, blocksUsed: 1, points: 300);
      }
      await tester.pump();

      await tapWorld(tester, 1);
      expect(find.byType(StageSelectView), findsOneWidget);
    });

    testWidgets('1º mundo da Trilha 2 fica bloqueado até a Trilha 1 estar 100% completa', (tester) async {
      final container = await pumpWorldSelect(tester, completeAll: false);
      container.read(onboardingProvider.notifier).markSeen(worlds[2].number);
      final progress = container.read(progressProvider.notifier);
      // Mundo 1 completo e Mundo 2 quase completo (falta a última fase).
      for (final level in [...world1Levels, ...world2Levels.take(world2Levels.length - 1)]) {
        progress.recordWin(level.id, stars: 3, blocksUsed: 1, points: 300);
      }
      await tester.pump();

      await tapWorld(tester, 2);
      expect(find.byType(StageSelectView), findsNothing);
      expect(find.text('Complete a Trilha 1 primeiro para desbloquear.'), findsOneWidget);
    });
  });
}

