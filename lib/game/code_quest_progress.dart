import '../models/code_quest_level.dart';

/// Progresso dentro de uma fase de "Missão de Código" (Mundo 4,
/// `WorldGameType.codeQuest`) — sem tabuleiro/grid, só um cursor de posição
/// dentro da sequência de perguntas. `currentQuestionIndex` avança 1 a cada
/// resposta certa; `totalAttempts` soma certas e erradas de toda a fase
/// (usado por `computeCodePuzzleScore`, ver `.claude/docs/GAME_DESIGN.md`).
class CodeQuestCursor {
  final int currentQuestionIndex;
  final int totalAttempts;

  const CodeQuestCursor({required this.currentQuestionIndex, required this.totalAttempts});

  factory CodeQuestCursor.fromStart() => const CodeQuestCursor(currentQuestionIndex: 0, totalAttempts: 0);

  CodeQuestCursor copyWith({int? currentQuestionIndex, int? totalAttempts}) => CodeQuestCursor(
        currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
        totalAttempts: totalAttempts ?? this.totalAttempts,
      );
}

enum CodeQuestAnswerOutcome { correct, wrong }

/// Compara a opção escolhida com `CodeQuestQuestion.correctOptionIndex` —
/// nenhuma outra regra além disso (sem falha "de verdade", ver
/// `CodeQuestLevel`).
CodeQuestAnswerOutcome checkCodeQuestAnswer(CodeQuestQuestion question, int selectedIndex) =>
    selectedIndex == question.correctOptionIndex ? CodeQuestAnswerOutcome.correct : CodeQuestAnswerOutcome.wrong;

/// Avança o cursor a partir do resultado de uma tentativa: uma resposta
/// certa move pro próximo passo do caminho; uma errada só soma a
/// tentativa, sem mover (o jogador tenta de novo a mesma pergunta).
CodeQuestCursor advanceCodeQuestCursor(CodeQuestCursor cursor, CodeQuestAnswerOutcome outcome) {
  final attempts = cursor.totalAttempts + 1;
  if (outcome == CodeQuestAnswerOutcome.correct) {
    return CodeQuestCursor(currentQuestionIndex: cursor.currentQuestionIndex + 1, totalAttempts: attempts);
  }
  return cursor.copyWith(totalAttempts: attempts);
}

/// `true` quando o cursor já passou da última pergunta da fase — a
/// Missão termina aqui, sempre em vitória (nunca existe "perder" esta
/// fase).
bool isCodeQuestComplete(CodeQuestCursor cursor, CodeQuestLevel level) =>
    cursor.currentQuestionIndex >= level.questions.length;
