import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:debuga_o_mascote/features/code_puzzle/presentation/gameplay/code_puzzle_gameplay_view.dart';
import 'package:debuga_o_mascote/models/code_puzzle_level.dart';
import 'package:debuga_o_mascote/widgets/program_block_chip_widget.dart';

import '../../helpers/test_container.dart';

/// Em "LINHAS DISPONÍVEIS" (Mundo 7, fases de reordenar), cada linha de
/// código é um card na largura toda da área, empilhado — linhas curtas como
/// `}` não viram cards pequenos lado a lado.
void main() {
  // Fase 3 do Mundo 7: tem uma linha longa (`for (...) {`) e uma curta (`}`).
  final level = world7Levels.firstWhere((l) => l.id == 'world7_level3');

  for (final size in const [Size(320, 568), Size(390, 844)]) {
    testWidgets('cards de linhas disponíveis têm a largura toda em $size', (tester) async {
      await tester.binding.setSurfaceSize(size);
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(wrapForTest(createTestContainer(), CodePuzzleGameplayView(levelId: level.id)));
      await tester.pump();
      expect(tester.takeException(), isNull);

      final cards = find.byWidgetPredicate((w) => w is ProgramBlockChip && w.fullWidth);
      expect(cards, findsNWidgets(level.correctOrder.length));

      // Largura da área de reordenar: a coluna que contém o título da seção.
      final areaWidth = tester.getSize(find.ancestor(of: find.text('LINHAS DISPONÍVEIS'), matching: find.byType(Column)).first).width;
      final shortCard = find.ancestor(of: find.text('}'), matching: find.byType(ProgramBlockChip));
      for (final element in cards.evaluate()) {
        expect(tester.getSize(find.byElementPredicate((e) => e == element)).width, areaWidth);
      }
      expect(tester.getSize(shortCard).width, areaWidth, reason: 'a linha curta `}` também ocupa a largura toda');

      // Os cards ficam empilhados: cada um começa abaixo do anterior, na
      // mesma posição horizontal.
      final lefts = cards.evaluate().map((e) => tester.getTopLeft(find.byElementPredicate((x) => x == e)));
      expect(lefts.map((o) => o.dx).toSet().length, 1);
    });
  }
}
