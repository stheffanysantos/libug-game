import 'package:flutter_test/flutter_test.dart';

import 'package:debuga_o_mascote/core/progress/progress_notifier.dart';
import 'package:debuga_o_mascote/core/progress/progress_state.dart';
import 'package:debuga_o_mascote/models/progress.dart';

import 'fake_progress_repository.dart';
import 'welcome_seams.dart';

/// Smoke test da infraestrutura de teste do bugfix `boas-vindas-primeira-vez`
/// (Task 0) — **NÃO** é o teste do bug (esse é a tarefa 1). Só verifica que os
/// seams existem, compilam e funcionam sem Firebase real, dando confiança de
/// que as tarefas 1/2 podem se apoiar neles.
void main() {
  group('Seam 1 — shouldShowWelcome (decisão pura da Splash)', () {
    test('nenhuma fonte viu → mostra a WelcomeView (primeira vez de verdade)', () {
      expect(
        shouldShowWelcome(localSeenWelcome: false, syncedSeenWelcome: false),
        WelcomeDecision.showWelcome,
      );
    });

    test('só o sincronizado viu (bug condition: local perdido) → vai pra Seleção de Mundo', () {
      expect(
        shouldShowWelcome(localSeenWelcome: false, syncedSeenWelcome: true),
        WelcomeDecision.goToWorldSelect,
      );
    });

    test('só o local viu → vai pra Seleção de Mundo', () {
      expect(
        shouldShowWelcome(localSeenWelcome: true, syncedSeenWelcome: false),
        WelcomeDecision.goToWorldSelect,
      );
    });

    test('F (só local) reexibe quando o local se perde, mesmo com sincronizado true', () {
      // Demonstra o seam que os testes da tarefa 1 usarão para provar o bug:
      // a decisão original ignora o sincronizado.
      expect(
        shouldShowWelcomeLocalOnly(localSeenWelcome: false),
        WelcomeDecision.showWelcome,
      );
    });
  });

  group('Seam 3 — mapeamento Firestore puro (fallback seenWelcome)', () {
    test('documento antigo sem seenWelcome → false', () {
      expect(seenWelcomeFromFirestoreMap(<String, dynamic>{}), isFalse);
    });

    test('documento com seenWelcome: true → true', () {
      expect(seenWelcomeFromFirestoreMap(<String, dynamic>{'seenWelcome': true}), isTrue);
    });

    test('progressStateFromFirestoreMap mapeia progresso e campos legados sem Firebase', () {
      final state = progressStateFromFirestoreMap(<String, dynamic>{
        'progress': {
          'fase1': {'stars': 3, 'bestBlocks': 2, 'bestPoints': 300},
        },
        'sessionScore': 150,
        'hasSubmittedToLeaderboard': true,
      });
      expect(state.starsFor('fase1'), 3);
      expect(state.forLevel('fase1')!.bestPoints, 300);
      expect(state.sessionScore, 150);
      expect(state.hasSubmittedToLeaderboard, isTrue);
    });

    test('firestoreMapFromProgressState espelha o map de save() para os campos de estado', () {
      const state = ProgressState(
        byLevelId: {'fase1': LevelProgress(stars: 2, bestBlocks: 4, bestPoints: 200)},
        sessionScore: 200,
        gameCompleted: true,
      );
      final map = firestoreMapFromProgressState(state);
      expect(map['sessionScore'], 200);
      expect(map['gameCompleted'], isTrue);
      expect((map['progress'] as Map)['fase1'], {'stars': 2, 'bestBlocks': 4, 'bestPoints': 200});
    });
  });

  group('Seam 4 — ProviderContainer com FakeProgressRepository captura save()', () {
    test('mutação do ProgressNotifier grava no fake (sem Firestore real)', () async {
      final repo = FakeProgressRepository();
      final container = containerWithFakeProgress(repo);
      final notifier = container.read(progressProvider.notifier);

      // Deixa a hidratação inicial (fire-and-forget) rodar antes de mutar.
      await Future<void>.delayed(Duration.zero);
      await Future<void>.delayed(Duration.zero);

      notifier.addSessionPoints(50);

      expect(repo.lastSaved, isNotNull, reason: 'toda mutação sincroniza via _syncNow()');
      expect(repo.lastSaved!.sessionScore, 50);
      expect(repo.saveCount, greaterThan(0));
    });

    test('fetch() semeado hidrata o ProgressNotifier via mergedWith', () async {
      final repo = FakeProgressRepository(
        seeded: const ProgressState(byLevelId: {'faseX': LevelProgress(stars: 3, bestBlocks: 1, bestPoints: 300)}),
      );
      final container = containerWithFakeProgress(repo);

      container.read(progressProvider);
      await Future<void>.delayed(Duration.zero);
      await Future<void>.delayed(Duration.zero);

      expect(container.read(progressProvider).isCompleted('faseX'), isTrue);
    });
  });

  group('Seam 2 — decisão via ProviderContainer com estados controlados', () {
    test('local semeado true → vai pra Seleção de Mundo', () async {
      expect(
        await welcomeDecisionFor(localSeenWelcome: true, syncedSeenWelcome: false),
        WelcomeDecision.goToWorldSelect,
      );
    });

    test('local false e sincronizado true → vai pra Seleção de Mundo (F\')', () async {
      expect(
        await welcomeDecisionFor(localSeenWelcome: false, syncedSeenWelcome: true),
        WelcomeDecision.goToWorldSelect,
      );
    });

    test('ambos false → mostra a WelcomeView', () async {
      expect(
        await welcomeDecisionFor(localSeenWelcome: false, syncedSeenWelcome: false),
        WelcomeDecision.showWelcome,
      );
    });
  });
}
