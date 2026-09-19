import 'package:flutter_test/flutter_test.dart';

import 'package:debuga_o_mascote/game/code_quest_progress.dart';
import 'package:debuga_o_mascote/models/block.dart';
import 'package:debuga_o_mascote/models/code_quest_level.dart';

void main() {
  const level = CodeQuestLevel(
    id: 'test_level',
    world: 4,
    number: 1,
    title: 'Teste',
    story: 'Uma histórinha qualquer.',
    questions: [
      CodeQuestQuestion(
        prompt: 'Pergunta 1',
        answerKind: CodeQuestAnswerKind.code,
        codeOptions: ['certo', 'errado'],
        correctOptionIndex: 0,
        explanation: 'Explicação 1.',
      ),
      CodeQuestQuestion(
        prompt: 'Pergunta 2',
        answerKind: CodeQuestAnswerKind.blockIcon,
        blockOptions: [BlockType.walk, BlockType.turnLeft],
        correctOptionIndex: 1,
        explanation: 'Explicação 2.',
      ),
    ],
  );

  test('CodeQuestCursor.fromStart começa na 1ª pergunta, sem tentativas', () {
    final cursor = CodeQuestCursor.fromStart();
    expect(cursor.currentQuestionIndex, 0);
    expect(cursor.totalAttempts, 0);
  });

  test('checkCodeQuestAnswer: índice certo é correct, qualquer outro é wrong', () {
    final question = level.questions[0];
    expect(checkCodeQuestAnswer(question, 0), CodeQuestAnswerOutcome.correct);
    expect(checkCodeQuestAnswer(question, 1), CodeQuestAnswerOutcome.wrong);
  });

  test('advanceCodeQuestCursor: acertar avança o índice e soma tentativa', () {
    final cursor = CodeQuestCursor.fromStart();
    final next = advanceCodeQuestCursor(cursor, CodeQuestAnswerOutcome.correct);
    expect(next.currentQuestionIndex, 1);
    expect(next.totalAttempts, 1);
  });

  test('advanceCodeQuestCursor: errar só soma tentativa, sem avançar', () {
    final cursor = CodeQuestCursor.fromStart();
    final next = advanceCodeQuestCursor(cursor, CodeQuestAnswerOutcome.wrong);
    expect(next.currentQuestionIndex, 0);
    expect(next.totalAttempts, 1);
  });

  test('advanceCodeQuestCursor acumula tentativas em erros consecutivos antes de acertar', () {
    var cursor = CodeQuestCursor.fromStart();
    cursor = advanceCodeQuestCursor(cursor, CodeQuestAnswerOutcome.wrong);
    cursor = advanceCodeQuestCursor(cursor, CodeQuestAnswerOutcome.wrong);
    cursor = advanceCodeQuestCursor(cursor, CodeQuestAnswerOutcome.correct);
    expect(cursor.currentQuestionIndex, 1);
    expect(cursor.totalAttempts, 3);
  });

  test('isCodeQuestComplete: false enquanto sobrar pergunta', () {
    final cursor = CodeQuestCursor.fromStart();
    expect(isCodeQuestComplete(cursor, level), isFalse);
  });

  test('isCodeQuestComplete: true depois da última pergunta respondida certo', () {
    var cursor = CodeQuestCursor.fromStart();
    cursor = advanceCodeQuestCursor(cursor, CodeQuestAnswerOutcome.correct);
    expect(isCodeQuestComplete(cursor, level), isFalse);
    cursor = advanceCodeQuestCursor(cursor, CodeQuestAnswerOutcome.correct);
    expect(isCodeQuestComplete(cursor, level), isTrue);
  });
}
