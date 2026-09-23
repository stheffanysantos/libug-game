import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:debuga_o_mascote/core/auth/auth_providers.dart';
import 'package:debuga_o_mascote/core/leaderboard/leaderboard_providers.dart';
import 'package:debuga_o_mascote/core/progress/progress_notifier.dart';
import 'package:debuga_o_mascote/core/progress/progress_repository.dart';
import 'package:debuga_o_mascote/core/progress/progress_state.dart';
import 'package:debuga_o_mascote/core/progress/record_level_win_usecase.dart';
import 'package:debuga_o_mascote/game/scoring.dart';
import 'package:debuga_o_mascote/models/game_track.dart';
import 'package:debuga_o_mascote/models/level.dart';

import '../../helpers/fake_auth_service.dart';
import '../../helpers/fake_leaderboard_repository.dart';

/// `RecordLevelWinUseCase` (`lib/core/progress/record_level_win_usecase.dart`)
/// — cobre a orquestração nova de 2026-09-17: reenvio automático da entrada
/// no Placar Geral a cada vitória (`LeaderboardSyncService`, via
/// `resync()` fire-and-forget) e a detecção de "zerou o jogo" (100% das 2
/// Trilhas). Ver `.claude/memory/decisions.md`.
class _NoopProgressRepository implements ProgressRepository {
  @override
  Future<ProgressState?> fetch() async => null;

  @override
  Future<void> save(ProgressState state) async {}
}

void main() {
  late FakeLeaderboardRepository fakeLeaderboard;
  late ProviderContainer container;

  setUp(() {
    fakeLeaderboard = FakeLeaderboardRepository();
    container = ProviderContainer(overrides: [
      progressRepositoryProvider.overrideWithValue(_NoopProgressRepository()),
      leaderboardRepositoryProvider.overrideWithValue(fakeLeaderboard),
      authServiceProvider.overrideWithValue(FakeAuthService(hasAccount: true, displayName: 'Ana')),
    ]);
    addTearDown(container.dispose);
  });

  // `resync()` é fire-and-forget (`unawaited`) — dá um respiro pro
  // microtask/Future completar antes de checar o fake.
  Future<void> flushMicrotasks() async {
    await Future<void>.delayed(Duration.zero);
    await Future<void>.delayed(Duration.zero);
  }

  RecordLevelWinUseCase useCase() => container.read(recordLevelWinUseCaseProvider);

  test('vitória antes de responder a pesquisa não envia nada pro Placar Geral', () async {
    useCase().call(
      levelId: 'world1_level1',
      world: worlds[0],
      score: const ScoreResult(stars: 3, points: 300),
      blocksUsedOrAttempts: 2,
      elapsedSeconds: 10,
    );
    await flushMicrotasks();

    expect(fakeLeaderboard.entries, isEmpty);
  });

  test('vitória depois de responder a pesquisa reenvia a entrada sozinha, com a pontuação atual', () async {
    container.read(progressProvider.notifier).submitToLeaderboard(age: 10, hasProgrammedBefore: true);

    useCase().call(
      levelId: 'world1_level1',
      world: worlds[0],
      score: const ScoreResult(stars: 3, points: 300),
      blocksUsedOrAttempts: 2,
      elapsedSeconds: 10,
    );
    await flushMicrotasks();

    expect(fakeLeaderboard.entries, hasLength(1));
    final first = fakeLeaderboard.entries.single;
    expect(first.name, 'Ana');
    expect(first.gameCompleted, isFalse);

    // 2ª vitória — mesma entrada (upsert por nome no fake), pontuação nova.
    useCase().call(
      levelId: 'world1_level2',
      world: worlds[0],
      score: const ScoreResult(stars: 3, points: 300),
      blocksUsedOrAttempts: 2,
      elapsedSeconds: 5,
    );
    await flushMicrotasks();

    expect(fakeLeaderboard.entries, hasLength(1), reason: 'atualiza a mesma entrada, não duplica');
    expect(fakeLeaderboard.entries.single.score, greaterThan(first.score));
  });

  test('zerar o jogo (100% das 2 Trilhas) marca gameCompleted e tira da lista topOverall', () async {
    container.read(progressProvider.notifier).submitToLeaderboard(age: 10, hasProgrammedBefore: true);
    final progressNotifier = container.read(progressProvider.notifier);

    // Vence todas as fases de todos os Mundos de todas as Trilhas, exceto a
    // última, direto pelo notifier (mais rápido que rodar o use case 60x) —
    // só a última fase de verdade passa pelo use case, pra testar a
    // transição "ainda não tinha zerado -> zerou agora".
    final allLevelIds = [for (final track in tracks) for (final world in track.worlds) for (final level in world.levels) level.id];
    for (final levelId in allLevelIds.sublist(0, allLevelIds.length - 1)) {
      progressNotifier.recordWin(levelId, stars: 3, blocksUsed: 1, points: 300);
    }
    expect(container.read(progressProvider).gameCompleted, isFalse);

    final lastWorld = tracks.last.worlds.last;
    useCase().call(
      levelId: allLevelIds.last,
      world: lastWorld,
      score: const ScoreResult(stars: 3, points: 300),
      blocksUsedOrAttempts: 1,
      elapsedSeconds: 5,
    );
    await flushMicrotasks();

    expect(container.read(progressProvider).gameCompleted, isTrue);
    expect(container.read(progressProvider).gameCompletedAt, isNotNull);
    expect(fakeLeaderboard.entries.single.gameCompleted, isTrue);

    final overall = await fakeLeaderboard.topOverall();
    final completed = await fakeLeaderboard.completedGame();
    expect(overall, isEmpty, reason: 'quem zerou some do Placar Geral');
    expect(completed, hasLength(1));
  });

  // Issue #6 — rejogar uma fase já concluída: a pontuação que fica é sempre
  // a melhor, por fase e no Placar Geral.
  group('rejogar uma fase já concluída', () {
    void win({required int stars, required int points, required int blocks, required int seconds}) {
      useCase().call(
        levelId: 'world1_level1',
        world: worlds[0],
        score: ScoreResult(stars: stars, points: points),
        blocksUsedOrAttempts: blocks,
        elapsedSeconds: seconds,
      );
    }

    test('rejogar pior não baixa a fase, o total do mundo, a sessão nem o Placar', () async {
      container.read(progressProvider.notifier).submitToLeaderboard(age: 10, hasProgrammedBefore: true);
      win(stars: 3, points: 300, blocks: 2, seconds: 10);
      await flushMicrotasks();
      final sessionAfterFirstWin = container.read(progressProvider).sessionScore;
      final placarAfterFirstWin = fakeLeaderboard.entries.single.score;

      win(stars: 1, points: 50, blocks: 6, seconds: 120);
      await flushMicrotasks();

      final progress = container.read(progressProvider);
      final level = progress.byLevelId['world1_level1']!;
      expect(level.stars, 3);
      expect(level.bestPoints, 300);
      expect(level.bestBlocks, 2);
      expect(progress.totalPoints(worlds[0].levels.map((l) => l.id)), 300);
      expect(progress.sessionScore, sessionAfterFirstWin);
      expect(fakeLeaderboard.entries.single.score, placarAfterFirstWin);
    });

    test('rejogar melhor sobe o resultado da fase, sem somar pontos de sessão de novo', () async {
      container.read(progressProvider.notifier).submitToLeaderboard(age: 10, hasProgrammedBefore: true);
      win(stars: 1, points: 50, blocks: 6, seconds: 120);
      await flushMicrotasks();
      final sessionAfterFirstWin = container.read(progressProvider).sessionScore;

      win(stars: 3, points: 300, blocks: 2, seconds: 10);
      await flushMicrotasks();

      final progress = container.read(progressProvider);
      final level = progress.byLevelId['world1_level1']!;
      expect(level.stars, 3);
      expect(level.bestPoints, 300);
      expect(level.bestBlocks, 2);
      expect(progress.sessionScore, sessionAfterFirstWin, reason: 'rejogar não infla o Placar');
      expect(fakeLeaderboard.entries.single.score, sessionAfterFirstWin);
    });
  });
}
