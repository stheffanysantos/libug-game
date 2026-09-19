import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../models/code_quest_level.dart';

part 'code_quest_gameplay_state.freezed.dart';

/// Estado da Gameplay do Mundo 4 ("Missão de Código") — sem passo a passo
/// nem grid (diferente do motor `maze`): um cursor de posição dentro da
/// sequência de perguntas da fase (`currentQuestionIndex`), avançando 1 a
/// cada resposta certa. Nunca existe "Falha" — uma resposta errada só soma
/// tentativa e mostra o feedback inline (`showWrongFeedback`), deixando o
/// jogador tentar de novo a mesma pergunta.
@freezed
class CodeQuestGameplayState with _$CodeQuestGameplayState {
  const factory CodeQuestGameplayState({
    required CodeQuestLevel level,
    @Default(0) int currentQuestionIndex,
    @Default(0) int totalAttempts,
    int? selectedOptionIndex,
    @Default(false) bool showWrongFeedback,
    CodeQuestGameplayEffect? pendingEffect,
  }) = _CodeQuestGameplayState;

  const CodeQuestGameplayState._();

  CodeQuestQuestion get currentQuestion => level.questions[currentQuestionIndex];
}

/// Sinal de navegação de uma única vez — a `CodeQuestGameplayView` consome
/// via `ref.listen` e chama `clearEffect()` antes de navegar. Só existe
/// `showResult` — a fase nunca navega para uma tela de derrota (ver
/// `CodeQuestGameplayState`).
@freezed
sealed class CodeQuestGameplayEffect with _$CodeQuestGameplayEffect {
  const factory CodeQuestGameplayEffect.showResult({required CodeQuestResultData data}) = ShowCodeQuestResult;
}

/// Dados prontos pra montar a `CodePuzzleResultView` (reaproveitada, mesmo
/// contrato de "veredito único" dos Mundos 5/6/7) — `won` é sempre `true`
/// aqui (só chega a este efeito depois da última pergunta ser respondida
/// certo).
class CodeQuestResultData {
  final int levelNumber;
  final int attempts;
  final int stars;
  final int points;
  final int worldNumber;

  /// `null` quando esta era a última fase do Mundo.
  final CodeQuestLevel? nextLevel;

  /// `true` só na 1ª vez que o Mundo fica 100% completo.
  final bool worldJustCompleted;

  const CodeQuestResultData({
    required this.levelNumber,
    required this.attempts,
    required this.stars,
    required this.points,
    required this.worldNumber,
    required this.nextLevel,
    required this.worldJustCompleted,
  });
}
