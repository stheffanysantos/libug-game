import 'package:flutter_test/flutter_test.dart';

import 'package:debuga_o_mascote/models/code_quest_level.dart';
import 'package:debuga_o_mascote/models/level.dart';

/// Consistência estrutural das 12 fases do Mundo 4 ("Missão de Código") —
/// mesmo espírito de `level_catalog_test.dart`/`world2_level_catalog_test.dart`,
/// mas sem motor de Execução pra rodar contra (não existe "solução", só
/// perguntas de múltipla escolha) — o que se verifica aqui é a forma dos
/// dados: ids únicos/estáveis, numeração sequencial, e cada pergunta com
/// `correctOptionIndex` dentro dos limites certos das opções do seu
/// `answerKind`.
void main() {
  test('world4Levels tem exatamente 12 fases, numeradas 1-12, todas do Mundo 4', () {
    expect(world4Levels.length, 12);
    for (var i = 0; i < world4Levels.length; i++) {
      expect(world4Levels[i].number, i + 1);
      expect(world4Levels[i].world, 4);
    }
  });

  test('ids são únicos e seguem o padrão world4_levelN', () {
    final ids = world4Levels.map((l) => l.id).toSet();
    expect(ids.length, world4Levels.length, reason: 'ids não podem se repetir');
    for (final level in world4Levels) {
      expect(level.id, 'world4_level${level.number}');
    }
  });

  test('toda fase tem pelo menos 1 pergunta, história e título não vazios', () {
    for (final level in world4Levels) {
      expect(level.questions, isNotEmpty, reason: '${level.id} sem pergunta nenhuma');
      expect(level.story, isNotEmpty, reason: '${level.id} sem história');
      expect(level.title, isNotEmpty, reason: '${level.id} sem título');
    }
  });

  test('toda pergunta tem pelo menos 2 opções do tipo certo e correctOptionIndex dentro dos limites', () {
    for (final level in world4Levels) {
      for (var i = 0; i < level.questions.length; i++) {
        final question = level.questions[i];
        final reason = '${level.id}, pergunta ${i + 1}';

        expect(question.prompt, isNotEmpty, reason: '$reason sem prompt');
        expect(question.explanation, isNotEmpty, reason: '$reason sem explicação');

        final optionCount = question.answerKind == CodeQuestAnswerKind.code ? question.codeOptions.length : question.blockOptions.length;
        expect(optionCount, greaterThanOrEqualTo(2), reason: '$reason precisa de pelo menos 2 opções');
        expect(question.optionCount, optionCount, reason: '$reason: optionCount deve bater com a lista certa do answerKind');
        expect(question.correctOptionIndex, inInclusiveRange(0, optionCount - 1), reason: '$reason: correctOptionIndex fora dos limites');

        if (question.answerKind == CodeQuestAnswerKind.code) {
          expect(question.blockOptions, isEmpty, reason: '$reason: answerKind code não deveria ter blockOptions');
        } else {
          expect(question.codeOptions, isEmpty, reason: '$reason: answerKind blockIcon não deveria ter codeOptions');
        }
      }
    }
  });

  test('worlds[3] (Mundo 4) aponta pra world4Levels com o gameType/nome novos', () {
    final world4 = worlds.firstWhere((w) => w.number == 4);
    expect(world4.gameType, WorldGameType.codeQuest);
    expect(world4.name, 'Missão de Código');
    expect(world4.levels.length, world4Levels.length);
    expect(world4.comingSoon, isFalse);
  });
}
