import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:debuga_o_mascote/features/maze/presentation/gameplay/gameplay_view.dart';
import 'package:debuga_o_mascote/features/maze/presentation/gameplay/gameplay_view_model.dart';
import 'package:debuga_o_mascote/models/block.dart';
import 'package:debuga_o_mascote/models/level.dart';
import 'package:debuga_o_mascote/widgets/command_button_widget.dart';
import 'package:debuga_o_mascote/widgets/program_block_chip_widget.dart';

import '../../helpers/test_container.dart';

/// `Repetir 3×` só repete o comando seguinte, então fica apagado enquanto
/// espera esse comando — o jogador entende sem texto que precisa escolher
/// outro comando antes de repetir de novo.
void main() {
  test('addBlock ignora um Repetir logo depois de outro Repetir', () {
    final container = createTestContainer();
    addTearDown(container.dispose);
    final provider = gameplayViewModelProvider(demoLevel.id);
    final notifier = container.read(provider.notifier);

    notifier.addBlock(BlockType.repeat);
    notifier.addBlock(BlockType.repeat);

    expect(container.read(provider).program, const [Block(BlockType.repeat)]);
  });

  CommandButton repeatButton(WidgetTester tester) =>
      tester.widget<CommandButton>(find.widgetWithText(CommandButton, 'Repetir 3×'));

  testWidgets('Repetir fica desabilitado até entrar o comando repetido ou ele ser apagado', (tester) async {
    await tester.pumpWidget(wrapForTest(createTestContainer(), GameplayView(levelId: demoLevel.id)));
    await tester.pump();

    expect(repeatButton(tester).enabled, isTrue);

    await tester.tap(find.widgetWithText(CommandButton, 'Repetir 3×'));
    await tester.pump();
    expect(repeatButton(tester).enabled, isFalse);
    // Sem comando ainda, o card do Repetir mostra o espaço vazio "?".
    expect(find.byKey(const Key('repeatEmptySlot')), findsOneWidget);

    // Tocar no botão apagado não acrescenta outro Repetir.
    await tester.tap(find.widgetWithText(CommandButton, 'Repetir 3×'), warnIfMissed: false);
    await tester.pump();
    expect(find.byKey(const Key('repeatGroup0')), findsOneWidget);
    expect(find.byKey(const Key('repeatGroup1')), findsNothing);

    await tester.tap(find.widgetWithText(CommandButton, 'Andar'));
    await tester.pump();
    expect(repeatButton(tester).enabled, isTrue);
    // O Andar aparece dentro do card do Repetir, no lugar do "?".
    expect(find.byKey(const Key('repeatEmptySlot')), findsNothing);
    expect(
      find.descendant(of: find.byKey(const Key('repeatGroup0')), matching: find.byType(ProgramBlockChip)),
      findsOneWidget,
    );

    // Apagar o comando de dentro deixa o Repetir esperando de novo.
    await tester.tap(find.byType(ProgramBlockChip));
    await tester.pump();
    expect(repeatButton(tester).enabled, isFalse);
    expect(find.byKey(const Key('repeatEmptySlot')), findsOneWidget);

    // Apagar o Repetir (tocar no card, fora do comando de dentro) libera o
    // botão.
    await tester.tapAt(tester.getTopLeft(find.byKey(const Key('repeatGroup0'))) + const Offset(4, 4));
    await tester.pump();
    expect(find.byKey(const Key('repeatGroup0')), findsNothing);
    expect(repeatButton(tester).enabled, isTrue);
  });
}
