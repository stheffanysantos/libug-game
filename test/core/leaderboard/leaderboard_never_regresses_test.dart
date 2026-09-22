import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:debuga_o_mascote/core/leaderboard/local_leaderboard_repository.dart';
import 'package:debuga_o_mascote/models/leaderboard_entry.dart';

/// Issue #28 — a entrada de um jogador no Placar Geral nunca regride: um
/// envio com pontuação menor (ex.: outro aparelho que ainda não carregou o
/// progresso da conta) não baixa a pontuação, e quem já zerou continua
/// zerado.
void main() {
  LeaderboardEntry entry({
    int score = 500,
    bool gameCompleted = false,
    DateTime? completedAt,
    String avatarId = 'lili',
    DateTime? updatedAt,
  }) =>
      LeaderboardEntry(
        name: 'Ana',
        age: 12,
        hasProgrammedBefore: false,
        score: score,
        updatedAt: updatedAt ?? DateTime(2026, 9, 22, 10),
        gameCompleted: gameCompleted,
        completedAt: completedAt,
        avatarId: avatarId,
      );

  group('mergeLeaderboardEntries', () {
    test('sem entrada salva, usa a enviada', () {
      final incoming = entry(score: 300);
      expect(mergeLeaderboardEntries(saved: null, incoming: incoming), same(incoming));
    });

    test('envio com pontuação menor não baixa a salva', () {
      final merged = mergeLeaderboardEntries(saved: entry(score: 500), incoming: entry(score: 300));
      expect(merged.score, 500);
    });

    test('envio com pontuação maior atualiza', () {
      final merged = mergeLeaderboardEntries(saved: entry(score: 500), incoming: entry(score: 700));
      expect(merged.score, 700);
    });

    test('quem já zerou continua zerado, com a data da 1ª vez', () {
      final firstTime = DateTime(2026, 9, 20);
      final merged = mergeLeaderboardEntries(
        saved: entry(gameCompleted: true, completedAt: firstTime),
        incoming: entry(gameCompleted: false),
      );
      expect(merged.gameCompleted, isTrue);
      expect(merged.completedAt, firstTime);
    });

    test('nome, avatar e data de atualização vêm do envio mais novo', () {
      final newer = DateTime(2026, 9, 22, 18);
      final merged = mergeLeaderboardEntries(
        saved: entry(score: 500, avatarId: 'lili'),
        incoming: entry(score: 300, avatarId: 'bit', updatedAt: newer),
      );
      expect(merged.avatarId, 'bit');
      expect(merged.updatedAt, newer);
    });
  });

  group('LocalLeaderboardRepository', () {
    setUp(() => SharedPreferences.setMockInitialValues({}));

    test('um envio menor depois de um maior não baixa o Placar', () async {
      final repository = LocalLeaderboardRepository();
      await repository.submit(entry(score: 500));
      await repository.submit(entry(score: 300));

      final top = await repository.topOverall();
      expect(top, hasLength(1));
      expect(top.single.score, 500);
    });
  });
}
