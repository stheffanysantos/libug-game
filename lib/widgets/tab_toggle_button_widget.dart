import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text.dart';

/// Botão de aba de um controle segmentado (2+ opções lado a lado, uma
/// selecionada por vez) — amarelo neon quando selecionado, painel escuro
/// quando não. Usado pelas abas "Geral"/"Zeraram o Jogo" do Placar e
/// "Cards"/"Código" da Gameplay do labirinto. Quem usa decide o estado
/// selecionado e o que a aba troca; este widget só desenha e repassa o toque.
class TabToggleButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  /// Altura vertical interna — 12 no Placar; a Gameplay usa menos para a
  /// linha de abas ocupar pouco espaço.
  final double verticalPadding;

  const TabToggleButton({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
    this.verticalPadding = 12,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? AppColors.yellowNeon : AppColors.panel,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: selected ? AppColors.yellowNeon : AppColors.grayButton, width: 2),
        ),
        child: Text(
          label,
          style: AppText.style(size: 14, weight: FontWeight.w900, color: selected ? AppColors.purpleDark : AppColors.white),
        ),
      ),
    );
  }
}
