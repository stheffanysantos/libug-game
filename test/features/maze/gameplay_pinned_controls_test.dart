import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:debuga_o_mascote/features/maze/presentation/gameplay/gameplay_view.dart';
import 'package:debuga_o_mascote/models/level.dart';
import 'package:debuga_o_mascote/widgets/command_button_widget.dart';

import '../../helpers/test_container.dart';

/// Os comandos e o PLAY ficam fixos no rodapé; só o resto da tela (cabeçalho,
/// tabuleiro, "Seu Programa") rola. Sem isso o jogador teria que rolar de volta
/// até os botões toda vez que montasse um bloco.
void main() {
  testWidgets('rolar a tela não move os comandos nem o PLAY, só o resto', (tester) async {
    // Celular baixo: o conteúdo não cabe, então a tela precisa rolar.
    await tester.binding.setSurfaceSize(const Size(390, 600));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(wrapForTest(createTestContainer(), GameplayView(levelId: demoLevel.id)));
    await tester.pump();

    final playTop = tester.getTopLeft(find.text('PLAY')).dy;
    final commandTop = tester.getTopLeft(find.widgetWithText(CommandButton, 'Andar')).dy;
    final programTitleTop = tester.getTopLeft(find.text('SEU PROGRAMA')).dy;

    await tester.drag(find.byType(SingleChildScrollView).first, const Offset(0, -300));
    await tester.pump();

    expect(tester.getTopLeft(find.text('PLAY')).dy, playTop);
    expect(tester.getTopLeft(find.widgetWithText(CommandButton, 'Andar')).dy, commandTop);
    expect(tester.getTopLeft(find.text('SEU PROGRAMA')).dy, lessThan(programTitleTop), reason: 'o conteúdo acima dos comandos é o que rola');
  });
}
