import 'dart:math' as math;

import 'character_avatar.dart';

/// Um registro no Placar Geral — um por jogador (não um histórico por
/// envio), criado na 1ª vez que ele preenche a pesquisa opcional (nome,
/// idade, "já programou antes?") e atualizado sozinho a cada vitória nova
/// dali em diante (ver `LeaderboardSyncService`). `age`/`hasProgrammedBefore`
/// não aparecem publicamente no placar (ver `.claude/memory/decisions.md`)
/// — ficam guardados só para quem organiza o estande olhar depois.
///
/// Placar **sem recorte de dia** — pedido explícito do usuário: quem "zera o
/// jogo" (100% das fases dos 7 Mundos) sai do Placar Geral e passa a
/// aparecer só na lista separada de quem zerou (`gameCompleted: true`).
class LeaderboardEntry {
  final String name;
  final int age;
  final bool hasProgrammedBefore;
  final int score;
  final DateTime updatedAt;

  /// Id de `CharacterAvatar` (`lib/models/character_avatar.dart`) escolhido
  /// pelo jogador em `ProfileEditView` — mostrado ao lado do nome no
  /// ranking. Documentos salvos antes deste campo existir (`fromJson`) caem
  /// no avatar padrão do jogo (`defaultAvatarId`), nunca quebram.
  final String avatarId;

  /// `true` depois que o jogador completa 100% das fases dos 7 Mundos
  /// (`ProgressState.gameCompleted`) — nesse ponto ele sai do Placar Geral e
  /// passa a aparecer só na lista de quem zerou.
  final bool gameCompleted;

  /// Quando `gameCompleted` virou `true` pela 1ª vez — `null` enquanto não
  /// zerou. Usado pra ordenar a lista de quem zerou (quem terminou primeiro
  /// aparece primeiro).
  final DateTime? completedAt;

  const LeaderboardEntry({
    required this.name,
    required this.age,
    required this.hasProgrammedBefore,
    required this.score,
    required this.updatedAt,
    this.gameCompleted = false,
    this.completedAt,
    this.avatarId = defaultAvatarId,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
        'hasProgrammedBefore': hasProgrammedBefore,
        'score': score,
        'updatedAt': updatedAt.toIso8601String(),
        'gameCompleted': gameCompleted,
        'completedAt': completedAt?.toIso8601String(),
        'avatarId': avatarId,
      };

  factory LeaderboardEntry.fromJson(Map<String, dynamic> json) => LeaderboardEntry(
        name: json['name'] as String,
        age: json['age'] as int,
        hasProgrammedBefore: json['hasProgrammedBefore'] as bool,
        score: json['score'] as int,
        updatedAt: DateTime.parse(json['updatedAt'] as String),
        gameCompleted: json['gameCompleted'] as bool? ?? false,
        completedAt: json['completedAt'] != null ? DateTime.parse(json['completedAt'] as String) : null,
        avatarId: json['avatarId'] as String? ?? defaultAvatarId,
      );
}

/// Junta a entrada que está sendo enviada (`incoming`) com a que já está
/// salva no Placar (`saved`), sem deixar o Placar regredir: a pontuação fica
/// com o maior dos dois valores, e quem já zerou o jogo continua zerado (com
/// a data da 1ª vez). O resto (nome, avatar, idade, data de atualização) vem
/// do envio mais novo. Evita que um aparelho que ainda não carregou o
/// progresso da conta baixe a pontuação da pessoa — ver
/// `.claude/memory/decisions.md` (issue #28).
LeaderboardEntry mergeLeaderboardEntries({required LeaderboardEntry? saved, required LeaderboardEntry incoming}) {
  if (saved == null) return incoming;
  return LeaderboardEntry(
    name: incoming.name,
    age: incoming.age,
    hasProgrammedBefore: incoming.hasProgrammedBefore,
    score: math.max(saved.score, incoming.score),
    updatedAt: incoming.updatedAt,
    gameCompleted: saved.gameCompleted || incoming.gameCompleted,
    completedAt: saved.gameCompleted ? (saved.completedAt ?? incoming.completedAt) : incoming.completedAt,
    avatarId: incoming.avatarId,
  );
}
