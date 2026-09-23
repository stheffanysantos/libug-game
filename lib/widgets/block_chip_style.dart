import 'package:flutter/material.dart';

import '../models/block.dart';
import '../theme/app_colors.dart';
import '../theme/app_icons.dart';

/// Rótulo, cores e ícone de um Bloco no "Seu Programa" e na Dica — única
/// fonte dessa correspondência (usada pela Gameplay e pela tela de
/// Tentativa Falha), para não duplicar a mesma lógica em mais de um lugar.
/// `icon` recebe o tamanho já calculado por quem chama — mesmo padrão de
/// `CommandButton.iconBuilder` — para caber tanto no botão de comando
/// (ícone grande) quanto no chip de "Seu Programa" (ícone menor, ver
/// `programBlockChipIconSize`).
class BlockChipStyle {
  final String label;
  final Color background;
  final Color foreground;

  /// Sombra dura (offset, blur 0) do `CommandButton` deste bloco na paleta
  /// de comandos — mesma cor "escurecida" do `background`, ver
  /// `.claude/memory/design-system.md`.
  final Color shadowColor;
  final int? repeatCount;
  final String? badgeText;
  final Widget Function(double size) icon;

  const BlockChipStyle({
    required this.label,
    required this.background,
    required this.foreground,
    required this.shadowColor,
    this.repeatCount,
    this.badgeText,
    required this.icon,
  });
}

/// Blocos disponíveis por Mundo — todos `WorldGameType.maze` usam os mesmos
/// 4 básicos. O Mundo 2 ("Resgate de Personagens") não tem bloco próprio de
/// resgate: `Andar` resgata automaticamente. Ver `.claude/docs/GAME_DESIGN.md`.
List<BlockType> availableBlockTypesForWorld(int worldNumber) {
  return const [
    BlockType.walk,
    BlockType.turnLeft,
    BlockType.turnRight,
    BlockType.repeat,
  ];
}

BlockChipStyle styleForBlock(Block block) {
  switch (block.type) {
    case BlockType.walk:
      return BlockChipStyle(
        label: 'Andar',
        background: AppColors.lilac,
        foreground: AppColors.purpleDark,
        shadowColor: AppColors.lilacShadow,
        icon: (size) => AppIcons.walk(size: size, color: AppColors.purpleDark),
      );
    case BlockType.turnLeft:
      return BlockChipStyle(
        label: 'Virar ←',
        background: AppColors.purple,
        foreground: AppColors.white,
        shadowColor: AppColors.purpleShadow,
        // Ícones de `turnLeft`/`turnRight` são o mesmo traço espelhado —
        // sem o rótulo ao lado (Mundo 1, "Seu Programa"), os dois ficam
        // ambíguos em miniatura (achado do UX Reviewer). Badge com a seta
        // do lado reforça a direção, mesmo padrão visual já usado pelo
        // badge "3×" de `Repetir`.
        badgeText: '←',
        icon: (size) => AppIcons.turnLeft(size: size, color: AppColors.white),
      );
    case BlockType.turnRight:
      return BlockChipStyle(
        label: 'Virar →',
        background: AppColors.purple,
        foreground: AppColors.white,
        shadowColor: AppColors.purpleShadow,
        badgeText: '→',
        icon: (size) => AppIcons.turnRight(size: size, color: AppColors.white),
      );
    case BlockType.repeat:
      return BlockChipStyle(
        label: 'Repetir',
        background: AppColors.yellowNeon,
        foreground: AppColors.purpleDark,
        shadowColor: AppColors.yellowShadow,
        repeatCount: 3,
        icon: (size) =>
            AppIcons.repeat(size: size, color: AppColors.purpleDark),
      );
  }
}
