import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../theme/app_text.dart';
import 'hard_shadow_box_widget.dart';

/// Botão de comando da Gameplay (Andar / Virar ← / Virar → / Repetir 3×) —
/// ícone + rótulo, com tamanho sempre derivado do espaço real disponível
/// (nunca px fixo), para caber em qualquer tamanho de tela e escalar bem
/// em tablets. `iconBuilder` recebe o tamanho de ícone já calculado.
class CommandButton extends StatelessWidget {
  final Widget Function(double size) iconBuilder;
  final String label;
  final Color background;
  final Color foreground;
  final Color shadowColor;
  final VoidCallback onTap;

  /// Contorno opcional — usado quando 2 comandos têm a mesma cor de fundo
  /// mas significados bem diferentes (ex. Mundo 2: "Se Amarelo" vs.
  /// "Enquanto Amarelo", empilhados na mesma coluna), para diferenciá-los
  /// além do ícone pequeno (achado do UX Reviewer: ícone sozinho não bastava
  /// num toque rápido de estande).
  final Border? border;

  const CommandButton({
    super.key,
    required this.iconBuilder,
    required this.label,
    required this.background,
    required this.foreground,
    required this.shadowColor,
    required this.onTap,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return HardShadowBox(
      color: background,
      shadows: [BoxShadow(color: shadowColor, offset: const Offset(0, 6), blurRadius: 0)],
      borderRadius: BorderRadius.circular(18),
      border: border,
      onTap: onTap,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final box = math.min(constraints.maxWidth, constraints.maxHeight);
          final iconSize = (box * 0.36).clamp(16.0, 30.0);
          final fontSize = (box * 0.17).clamp(10.0, 14.0);
          // Rótulos mais longos (ex. "Se tiver, resgate" do Mundo 2, bem mais
          // longo que "Andar"/"Virar ←" do Mundo 1) quebram em até 2 linhas
          // em vez de encolher a fonte até ficar ilegível — a grade pode ter
          // 5 botões lado a lado (células estreitas). O texto não é truncado
          // (nada de reticências): o jogador precisa ler o comando inteiro.
          // A largura fixa do `SizedBox` é o que faz o texto quebrar dentro
          // do `FittedBox`, que só entra como rede de segurança: se ícone +
          // 2 linhas ainda passarem da altura da célula, o conjunto encolhe
          // em vez de estourar.
          return Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: SizedBox(
                width: math.max(0, constraints.maxWidth - 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    iconBuilder(iconSize),
                    SizedBox(height: box * 0.045),
                    Text(
                      label,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: AppText.style(size: fontSize, weight: FontWeight.w900, color: foreground),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
