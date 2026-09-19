import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/progress/record_level_win_usecase.dart';
import '../../../../game/code_puzzle_scoring.dart';
import '../../../../game/code_quest_progress.dart';
import '../../../../models/code_quest_level.dart';
import '../../../../models/level.dart';
import 'code_quest_gameplay_state.dart';

part 'code_quest_gameplay_view_model.g.dart';

/// ViewModel da Gameplay do Mundo 4 ("Missão de Código") — sem passo a
/// passo/grid (diferente de `GameplayViewModel`): cada `confirm()` avança
/// ou não o cursor de pergunta conforme `checkCodeQuestAnswer`
/// (`lib/game/code_quest_progress.dart`). Família por `levelId`.
@riverpod
class CodeQuestGameplayViewModel extends _$CodeQuestGameplayViewModel {
  /// Mesmo motivo/uso de `_levelStopwatch` em `GameplayViewModel` (Mundo 1)
  /// — só para o Placar do Dia, nunca mostrado na UI.
  final Stopwatch _levelStopwatch = Stopwatch()..start();

  @override
  CodeQuestGameplayState build(String levelId) {
    final level = world4Levels.firstWhere((l) => l.id == levelId);
    return CodeQuestGameplayState(level: level);
  }

  void selectOption(int index) => state = state.copyWith(selectedOptionIndex: index, showWrongFeedback: false);

  void clearEffect() => state = state.copyWith(pendingEffect: null);

  /// Chamado pela View quando o jogador toca o ícone de "jogar de novo" na
  /// tela de Vitória (`CodePuzzleResultView._buildWon`) — mesmo cuidado já
  /// documentado nos outros mundos de veredito único (ver
  /// `.claude/memory/decisions.md`, "Bug real corrigido: `attempts` não
  /// resetava..."): esse atalho só faz `pop()` de volta pra esta mesma
  /// instância/provider, então sem este reset explícito `totalAttempts`
  /// continuaria acumulando indefinidamente entre replays rápidos. Reseta
  /// para exatamente o estado que `build()` produziria.
  void resetForReplay() => state = CodeQuestGameplayState(level: state.level);

  void confirm() {
    final selected = state.selectedOptionIndex;
    if (selected == null) return;

    final question = state.currentQuestion;
    final outcome = checkCodeQuestAnswer(question, selected);
    final totalAttempts = state.totalAttempts + 1;

    if (outcome == CodeQuestAnswerOutcome.wrong) {
      // Não avança o caminho — só soma a tentativa e mostra o feedback
      // inline, limpando a seleção pra forçar o jogador a escolher de novo
      // (mesmo cuidado de `clearSelectionAfterLoss` nos outros mundos,
      // aplicado aqui na hora em vez de depois de navegar, já que esta
      // fase nunca navega numa resposta errada).
      state = state.copyWith(totalAttempts: totalAttempts, selectedOptionIndex: null, showWrongFeedback: true);
      return;
    }

    final level = state.level;
    final nextQuestionIndex = state.currentQuestionIndex + 1;
    if (nextQuestionIndex < level.questions.length) {
      state = state.copyWith(
        currentQuestionIndex: nextQuestionIndex,
        totalAttempts: totalAttempts,
        selectedOptionIndex: null,
        showWrongFeedback: false,
      );
      return;
    }

    // Última pergunta respondida certo — a Missão termina aqui, sempre em
    // vitória (nunca existe "perder" esta fase, ver `CodeQuestLevel`).
    final score = computeCodePuzzleScore(attempts: totalAttempts);
    final world = worlds.firstWhere((w) => w.number == level.world);
    final result = ref.read(recordLevelWinUseCaseProvider).call(
          levelId: level.id,
          world: world,
          score: score,
          blocksUsedOrAttempts: totalAttempts,
          elapsedSeconds: _levelStopwatch.elapsed.inSeconds,
        );

    final levelsInWorld = world.levels.cast<CodeQuestLevel>();
    final levelIndex = levelsInWorld.indexWhere((l) => l.id == level.id);
    final nextLevel = (levelIndex >= 0 && levelIndex + 1 < levelsInWorld.length) ? levelsInWorld[levelIndex + 1] : null;

    state = state.copyWith(
      totalAttempts: totalAttempts,
      pendingEffect: CodeQuestGameplayEffect.showResult(
        data: CodeQuestResultData(
          levelNumber: level.number,
          attempts: totalAttempts,
          stars: score.stars,
          points: score.points,
          worldNumber: level.world,
          nextLevel: nextLevel,
          worldJustCompleted: result.worldJustCompleted,
        ),
      ),
    );
  }
}
