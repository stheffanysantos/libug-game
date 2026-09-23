import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:debuga_o_mascote/features/splash/presentation/splash_view.dart';
import 'package:debuga_o_mascote/widgets/mascot_image_widget.dart';

import '../helpers/test_container.dart';

/// Issue #32 — o palco da Splash abre com a Lili programando
/// (`mascot_coding.png`), não mais com a Lili de olhos fechados
/// (`MascotImage`), que parecia dormindo.
void main() {
  testWidgets('Splash mostra a Lili programando e não a Lili de olhos fechados', (tester) async {
    await tester.pumpWidget(wrapForTest(createTestContainer(), const SplashView()));
    await tester.pump();

    final codingMascot = find.byWidgetPredicate(
      (w) => w is Image && w.image is AssetImage && (w.image as AssetImage).assetName == 'assets/images/mascot_coding.png',
    );
    expect(codingMascot, findsOneWidget);
    expect(find.byType(MascotImage), findsNothing);
  });
}
