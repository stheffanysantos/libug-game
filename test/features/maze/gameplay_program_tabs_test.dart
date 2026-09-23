import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:debuga_o_mascote/features/maze/presentation/gameplay/gameplay_view.dart';
import 'package:debuga_o_mascote/models/level.dart';
import 'package:debuga_o_mascote/widgets/command_button_widget.dart';
import 'package:debuga_o_mascote/widgets/program_block_chip_widget.dart';

import '../../helpers/test_container.dart';

/// "Seu Programa" tem duas visões do mesmo Programa alternáveis por aba —
/// Cards (chips) e Código (pseudo-código). Cobre só o comportamento da aba;
/// o pseudo-código em si é coberto pela tradução em `programCodeLinesFor`.
void main() {
  final chips = find.byType(ProgramBlockChip);
  final codeView = find.byKey(const Key('mazeCodeTranslator'));
  final cardsTab = find.byKey(const Key('programTabCards'));
  final codeTab = find.byKey(const Key('programTabCode'));

  Future<void> pumpGameplay(WidgetTester tester) async {
    // Tela alta o bastante para tudo ficar visível sem rolar (mesmo padrão
    // de `gameplay_flow_test.dart`).
    await tester.binding.setSurfaceSize(const Size(400, 1700));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(wrapForTest(createTestContainer(), GameplayView(levelId: demoLevel.id)));
    await tester.pump();
  }

  Future<void> addBlock(WidgetTester tester, String label) async {
    await tester.tap(find.widgetWithText(CommandButton, label));
    await tester.pump();
  }

  testWidgets('abre na aba Cards, com os chips e sem a visão de código', (tester) async {
    await pumpGameplay(tester);
    await addBlock(tester, 'Andar');

    expect(chips, findsOneWidget);
    expect(codeView, findsNothing);
  });

  testWidgets('tocar em Código mostra o pseudo-código do mesmo Programa', (tester) async {
    await pumpGameplay(tester);
    await addBlock(tester, 'Andar');

    await tester.tap(codeTab);
    await tester.pump();

    expect(codeView, findsOneWidget);
    expect(find.textContaining('andar();', findRichText: true), findsOneWidget);
    expect(chips, findsNothing);
  });

  testWidgets('a aba escolhida persiste enquanto o Programa muda', (tester) async {
    await pumpGameplay(tester);
    await tester.tap(codeTab);
    await tester.pump();
    expect(find.textContaining('monte um Programa', findRichText: true), findsOneWidget);

    await addBlock(tester, 'Virar →');

    expect(codeView, findsOneWidget);
    expect(find.textContaining('virarDireita();', findRichText: true), findsOneWidget);
  });

  testWidgets('voltar para Cards restaura os chips', (tester) async {
    await pumpGameplay(tester);
    await addBlock(tester, 'Andar');
    await tester.tap(codeTab);
    await tester.pump();

    await tester.tap(cardsTab);
    await tester.pump();

    expect(chips, findsOneWidget);
    expect(codeView, findsNothing);
  });

  testWidgets('LIMPAR esvazia o Programa na aba Código', (tester) async {
    await pumpGameplay(tester);
    await addBlock(tester, 'Andar');
    await tester.tap(codeTab);
    await tester.pump();

    await tester.tap(find.text('LIMPAR'));
    await tester.pump();

    expect(find.textContaining('andar();', findRichText: true), findsNothing);
    expect(find.textContaining('monte um Programa', findRichText: true), findsOneWidget);
  });
}
