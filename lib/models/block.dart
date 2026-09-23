/// Tipos de comando que o jogador pode adicionar ao Programa — os mesmos 4
/// nos Mundos 1, 2 e 3 (todos `WorldGameType.maze`). No Mundo 2 ("Resgate
/// de Personagens") não há bloco próprio de resgate: `walk` resgata
/// automaticamente o personagem da casa onde chega. Ver
/// `.claude/docs/GAME_DESIGN.md` e `.claude/memory/decisions.md`, entrada
/// de 2026-09-22.
enum BlockType {
  walk,
  turnLeft,
  turnRight,
  repeat,
}

/// Um bloco do Programa montado pelo jogador. `repeat` se aplica ao bloco
/// imediatamente seguinte no Programa (ver `ProgramExecutor.expand`).
class Block {
  final BlockType type;

  const Block(this.type);

  @override
  bool operator ==(Object other) => other is Block && other.type == type;

  @override
  int get hashCode => type.hashCode;
}
