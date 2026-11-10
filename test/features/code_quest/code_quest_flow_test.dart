import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:debuga_o_mascote/features/code_quest/presentation/gameplay/code_quest_gameplay_view.dart';
import 'package:debuga_o_mascote/features/result/presentation/code_puzzle_result_view.dart';
import 'package:debuga_o_mascote/models/code_quest_level.dart';

import '../../helpers/test_container.dart';

/// Mesmo espírito de `test/features/predict_output/predict_output_flow_test.dart`,
/// mas para o Mundo 4 ("Missão de Código"): sequência de perguntas por
/// fase, sem "Falha" (errar só soma tentativa e mostra feedback inline,
/// sem navegar) — ver `.claude/rules/testing.md`.
void main() {
  // Fase 1 ('world4_level1'): 3 perguntas, todas `blockIcon` — índices
  // certos 1, 0, 2 (ver `lib/models/code_quest_level.dart`).
  final level = world4Levels.firstWhere((l) => l.id == 'world4_level1');

  Finder onResult(Finder finder) => find.descendant(of: find.byType(CodePuzzleResultView), matching: finder);

  Future<void> answer(WidgetTester tester, int index) async {
    await tester.tap(find.byKey(Key('codeQuestOption_$index')));
    await tester.pump();
    await tester.tap(find.text('Confirmar'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
  }

  testWidgets('responder tudo certo, sem errar, navega para o Resultado com vitória e pontuação máxima', (tester) async {
    await tester.pumpWidget(wrapForTest(createTestContainer(), CodeQuestGameplayView(levelId: level.id)));
    await tester.pump();

    expect(find.text('Passo 1 / 3'), findsOneWidget);
    await answer(tester, 1);
    expect(find.text('Passo 2 / 3'), findsOneWidget, reason: 'acertar avança pro próximo passo do caminho');

    await answer(tester, 0);
    expect(find.text('Passo 3 / 3'), findsOneWidget);

    await answer(tester, 2);

    expect(find.byType(CodePuzzleResultView), findsOneWidget);
    expect(onResult(find.text('FASE 1 CONCLUÍDA')), findsOneWidget);
    // Só respostas erradas contam como tentativa extra: acertar as 3
    // perguntas de primeira é "1 tentativa" (3 estrelas, 300 pontos).
    expect(onResult(find.text('1')), findsOneWidget, reason: 'TENTATIVAS deve mostrar 1 (nenhum erro)');
    expect(onResult(find.text('300')), findsOneWidget, reason: 'computeCodePuzzleScore(attempts: 1) => 300');
  });

  testWidgets('responder errado soma tentativa e mostra o feedback inline, sem avançar nem sair da tela', (tester) async {
    await tester.pumpWidget(wrapForTest(createTestContainer(), CodeQuestGameplayView(levelId: level.id)));
    await tester.pump();

    // Índice 0 é uma distratora da 1ª pergunta (certa é 1).
    await answer(tester, 0);

    expect(find.byType(CodePuzzleResultView), findsNothing, reason: 'errar não navega pra lugar nenhum');
    expect(find.text('Passo 1 / 3'), findsOneWidget, reason: 'errar não avança o caminho');
    expect(find.text(level.questions[0].explanation), findsOneWidget, reason: 'explicação aparece inline ao errar');

    // Agora acerta — a fase continua normalmente, só com 1 tentativa a mais.
    await answer(tester, 1);
    await answer(tester, 0);
    await answer(tester, 2);

    expect(onResult(find.text('2')), findsOneWidget, reason: 'TENTATIVAS deve contar o erro: 1 erro + 1');
    expect(onResult(find.text('200')), findsOneWidget, reason: 'PONTOS penalizados pela tentativa extra: 300 - 100');
  });

  testWidgets('Confirmar fica desabilitado até uma opção ser escolhida', (tester) async {
    await tester.pumpWidget(wrapForTest(createTestContainer(), CodeQuestGameplayView(levelId: level.id)));
    await tester.pump();

    await tester.tap(find.text('Confirmar'));
    await tester.pump();

    expect(find.text('Passo 1 / 3'), findsOneWidget, reason: 'sem opção escolhida, Confirmar não faz nada');
  });

  testWidgets(
    'replay rápido a partir do ícone de "jogar de novo" na Vitória reseta o caminho e as tentativas',
    (tester) async {
      await tester.binding.setSurfaceSize(const Size(400, 1400));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(wrapForTest(createTestContainer(), CodeQuestGameplayView(levelId: level.id)));
      await tester.pump();

      await answer(tester, 1);
      await answer(tester, 0);
      await answer(tester, 2);
      expect(onResult(find.text('1')), findsOneWidget);

      await tester.tap(find.byKey(const Key('codePuzzleResultReplayButton')));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.text('Passo 1 / 3'), findsOneWidget, reason: 'nova sessão — o caminho deve ter voltado ao início');

      await answer(tester, 1);
      await answer(tester, 0);
      await answer(tester, 2);
      expect(onResult(find.text('1')), findsOneWidget, reason: 'TENTATIVAS não deveria ter herdado nada da sessão anterior');
      expect(onResult(find.text('300')), findsOneWidget, reason: 'PONTOS deve voltar ao mesmo valor de uma sessão limpa, não continuar caindo');
    },
  );
}
