import 'block.dart';
import 'code_line.dart';
import 'game_level.dart';

/// De onde vêm as opções de resposta de uma `CodeQuestQuestion` — texto de
/// código (`codeOptions`) ou ícone/rótulo de Bloco do motor `maze`
/// (`blockOptions`, reaproveitando `BlockType`/`styleForBlock` só como
/// fonte visual, sem nenhuma dependência do motor de execução do
/// labirinto). Ver `.claude/docs/GAME_DESIGN.md`, seção "Mundo 4 — Missão
/// de Código".
enum CodeQuestAnswerKind { code, blockIcon }

/// Um passo da Missão — 1 pergunta de múltipla escolha (A/B/C/D). Cada
/// resposta certa avança o Mascote 1 posição no caminho linear da fase;
/// uma resposta errada só soma 1 tentativa e deixa o jogador tentar de
/// novo (nunca existe "perder a fase", ver `CodeQuestLevel`).
class CodeQuestQuestion {
  final String prompt;

  /// Trecho de código de contexto, mostrado acima da pergunta — vazio
  /// quando a pergunta não precisa de nenhum código (ex.: pura sobre
  /// ícones de bloco).
  final List<CodeLine> code;

  final CodeQuestAnswerKind answerKind;

  /// 2-4 opções em texto — só quando `answerKind == code`.
  final List<String> codeOptions;

  /// 2-4 opções por ícone/rótulo de Bloco — só quando
  /// `answerKind == blockIcon`.
  final List<BlockType> blockOptions;

  /// Índice 0-based da opção certa em `codeOptions`/`blockOptions`
  /// (conforme `answerKind`).
  final int correctOptionIndex;

  /// Feedback educativo — mostrado sempre que o jogador confirma uma
  /// resposta (certa ou errada), inline na própria tela (sem navegar).
  final String explanation;

  const CodeQuestQuestion({
    required this.prompt,
    this.code = const [],
    required this.answerKind,
    this.codeOptions = const [],
    this.blockOptions = const [],
    required this.correctOptionIndex,
    required this.explanation,
  });

  /// Quantidade de opções desta pergunta, já resolvendo qual lista olhar
  /// conforme `answerKind` — usado pela Gameplay pra iterar sem repetir
  /// esse `switch` em mais de um lugar.
  int get optionCount => answerKind == CodeQuestAnswerKind.code ? codeOptions.length : blockOptions.length;
}

/// Uma fase do Mundo 4 ("Missão de Código", `WorldGameType.codeQuest`): uma
/// histórinha curta (`story`, sempre visível no topo da Gameplay) mais uma
/// sequência de `questions` — cada resposta certa avança o Mascote 1 passo
/// no caminho linear até o fim da fase. Sem tabuleiro/grid (diferente do
/// motor `maze`) e sem "Falha" (diferente de todos os outros mundos —
/// mesmo espírito de "não existe quase certo" dos Mundos 5/6/7, mas aqui
/// nem "errar tudo" derruba a fase: o jogador sempre acaba vencendo,
/// só demora mais tentativas). Substitui o antigo "Decisões em Bloco"
/// (`BlockProgramLevel`/`WorldGameType.blockProgram`) — ver
/// `.claude/memory/decisions.md`, entrada de 2026-09-18 ("Mundo 4 pivota
/// para 'Missão de Código'").
class CodeQuestLevel implements GameLevel {
  @override
  final String id;
  final int world;

  /// Posição da fase dentro do mundo (1-12) — usada na Seleção de Fases e
  /// no cabeçalho da Gameplay ("FASE N").
  final int number;

  /// Instrução curta mostrada no cabeçalho da Gameplay (ex.: "Ensine o
  /// robô").
  final String title;

  /// Histórinha curta (1-3 frases) que dá contexto à fase — sempre visível
  /// no topo, mesmo papel do card "PROBLEMA" do antigo Mundo 4.
  final String story;

  /// 1 pergunta = 1 passo no caminho — a fase termina quando todas são
  /// respondidas corretamente, na ordem.
  final List<CodeQuestQuestion> questions;

  const CodeQuestLevel({
    required this.id,
    required this.world,
    required this.number,
    required this.title,
    required this.story,
    required this.questions,
  });
}

/// As 12 fases do Mundo 4 ("Missão de Código"): uma missão contínua em que
/// o Mascote ajuda um robozinho perdido a entender programação, do
/// primeiro comando até combinar laço + decisão + achar bugs — a mesma
/// progressão pedagógica da Trilha 3 (ler/completar/depurar código de
/// verdade), só que em forma de perguntas de múltipla escolha com avanço
/// visual no caminho, sem exigir montar/editar nada. Fases 1 (só ícones de
/// Bloco) e 2 (sequência) reaproveitam conceitos já vistos na Trilha 1;
/// Fases 3-5 introduzem variáveis/aritmética; Fases 6-7, decisão (`if`/
/// `else`); Fases 8-9, laço (`for`) e a combinação laço+decisão (o mesmo
/// padrão de "Para cada número" + bloco condicional do antigo Mundo 4);
/// Fase 10 introduz achar erros de código (ponte pro Modo Debug, Mundo 7);
/// Fases 11-12 leem trechos maiores, terminando numa mistura de código e
/// um lembrete do Mundo 2 (ícone de bloco). Dados consistentes verificados
/// em `test/game/code_quest_catalog_test.dart`. Ver
/// `.claude/docs/GAME_DESIGN.md`.
final world4Levels = <CodeQuestLevel>[
  CodeQuestLevel(
    id: 'world4_level1',
    world: 4,
    number: 1,
    title: 'Ensine o robô',
    story: 'Lili encontrou um robozinho de resgate perdido no corredor. Ele só entende comandos bem simples — ajude a guiá-lo até a saída respondendo certinho!',
    questions: const [
      CodeQuestQuestion(
        prompt: 'Qual comando faz o robô andar para frente?',
        answerKind: CodeQuestAnswerKind.blockIcon,
        blockOptions: [BlockType.turnLeft, BlockType.walk, BlockType.repeat],
        correctOptionIndex: 1,
        explanation: "'Andar' move o robô uma casa para frente, na direção que ele já está olhando.",
      ),
      CodeQuestQuestion(
        prompt: 'Depois de andar, qual comando faz o robô virar para a direita?',
        answerKind: CodeQuestAnswerKind.blockIcon,
        blockOptions: [BlockType.turnRight, BlockType.walk, BlockType.turnLeft],
        correctOptionIndex: 0,
        explanation: "'Virar →' gira o robô 90° para a direita, sem mudar de casa.",
      ),
      CodeQuestQuestion(
        prompt: 'Você quer que o robô ande 3 vezes seguidas sem copiar o bloco 3 vezes. Qual comando usa?',
        answerKind: CodeQuestAnswerKind.blockIcon,
        blockOptions: [BlockType.walk, BlockType.turnLeft, BlockType.repeat],
        correctOptionIndex: 2,
        explanation: "'Repetir 3×' aplica o próximo comando três vezes seguidas, sem precisar repetir o bloco.",
      ),
    ],
  ),
  CodeQuestLevel(
    id: 'world4_level2',
    world: 4,
    number: 2,
    title: 'A ordem importa',
    story: 'O robô só faz exatamente o que você manda, na ordem que você manda. Um passo fora de ordem e ele se perde!',
    questions: const [
      CodeQuestQuestion(
        prompt: 'Nesse código, o que o robô faz primeiro?',
        code: [CodeLine('andar();'), CodeLine('virar_direita();')],
        answerKind: CodeQuestAnswerKind.code,
        codeOptions: ['Anda para frente', 'Vira para a direita', 'As duas coisas ao mesmo tempo'],
        correctOptionIndex: 0,
        explanation: "O código roda de cima para baixo — 'andar();' está na primeira linha, então roda primeiro.",
      ),
      CodeQuestQuestion(
        prompt: 'Depois de rodar esse código, quantas vezes o robô andou?',
        code: [CodeLine('virar_esquerda();'), CodeLine('andar();'), CodeLine('andar();')],
        answerKind: CodeQuestAnswerKind.code,
        codeOptions: ['1 vez', '2 vezes', '3 vezes'],
        correctOptionIndex: 1,
        explanation: "'andar();' aparece 2 vezes no código — o robô anda duas casas depois de virar.",
      ),
      CodeQuestQuestion(
        prompt: 'Se você trocar a ordem — primeiro "andar()", depois "virar_esquerda()" — o caminho final muda?',
        answerKind: CodeQuestAnswerKind.code,
        codeOptions: ['Sim, muda', 'Não, dá sempre no mesmo lugar', 'Só muda se ele repetir'],
        correctOptionIndex: 0,
        explanation: 'A ordem dos comandos muda o resultado — andar antes de virar leva o robô por um caminho diferente de virar antes de andar.',
      ),
    ],
  ),
  CodeQuestLevel(
    id: 'world4_level3',
    world: 4,
    number: 3,
    title: 'Guardando números',
    story: 'O robô tem uma caixinha na cabeça onde guarda um número. Essa caixinha se chama variável.',
    questions: const [
      CodeQuestQuestion(
        prompt: 'O que essa linha faz?',
        code: [CodeLine('int vidas = 3;')],
        answerKind: CodeQuestAnswerKind.code,
        codeOptions: ["Cria uma variável chamada 'vidas' guardando o número 3", "Soma 3 à variável 'vidas'", "Apaga a variável 'vidas'"],
        correctOptionIndex: 0,
        explanation: "'int vidas = 3;' cria uma variável inteira chamada 'vidas' e guarda o valor 3 nela.",
      ),
      CodeQuestQuestion(
        prompt: 'O que aparece na tela?',
        code: [CodeLine('int vidas = 3;'), CodeLine('print(vidas);')],
        answerKind: CodeQuestAnswerKind.code,
        codeOptions: ['3', 'vidas', '0'],
        correctOptionIndex: 0,
        explanation: "'print(vidas)' mostra o valor guardado em 'vidas', que é 3.",
      ),
      CodeQuestQuestion(
        prompt: 'E agora, o que aparece?',
        code: [CodeLine('int vidas = 3;'), CodeLine('vidas = 5;'), CodeLine('print(vidas);')],
        answerKind: CodeQuestAnswerKind.code,
        codeOptions: ['3', '5', '3 e 5'],
        correctOptionIndex: 1,
        explanation: "A 2ª linha troca o valor guardado em 'vidas' de 3 para 5 — o print mostra o valor mais recente.",
      ),
    ],
  ),
  CodeQuestLevel(
    id: 'world4_level4',
    world: 4,
    number: 4,
    title: 'Fazendo contas',
    story: 'O robô precisa somar moedas coletadas para saber se já tem o suficiente pra abrir a porta.',
    questions: const [
      CodeQuestQuestion(
        prompt: "Quanto vale 'moedas' depois dessa linha?",
        code: [CodeLine('int moedas = 2;'), CodeLine('moedas = moedas + 3;')],
        answerKind: CodeQuestAnswerKind.code,
        codeOptions: ['2', '3', '5'],
        correctOptionIndex: 2,
        explanation: "'moedas + 3' soma 3 ao valor atual (2), resultando em 5, e guarda de volta em 'moedas'.",
      ),
      CodeQuestQuestion(
        prompt: "Quanto vale 'pontos' agora?",
        code: [CodeLine('int pontos = 10;'), CodeLine('pontos = pontos - 4;')],
        answerKind: CodeQuestAnswerKind.code,
        codeOptions: ['6', '10', '4'],
        correctOptionIndex: 0,
        explanation: '10 - 4 = 6.',
      ),
      CodeQuestQuestion(
        prompt: "Qual código soma 1 ao valor de 'contador'?",
        answerKind: CodeQuestAnswerKind.code,
        codeOptions: ['contador = contador + 1;', 'contador = 1;', 'contador = contador - 1;'],
        correctOptionIndex: 0,
        explanation: "'contador = contador + 1;' pega o valor atual e soma 1.",
      ),
    ],
  ),
  CodeQuestLevel(
    id: 'world4_level5',
    world: 4,
    number: 5,
    title: 'Comparando valores',
    story: 'Antes de decidir o que fazer, o robô precisa saber comparar números.',
    questions: const [
      CodeQuestQuestion(
        prompt: "O que '5 == 5' responde?",
        answerKind: CodeQuestAnswerKind.code,
        codeOptions: ['verdadeiro', 'falso', '5'],
        correctOptionIndex: 0,
        explanation: "'==' compara se os dois valores são iguais — 5 é igual a 5, então é verdadeiro.",
      ),
      CodeQuestQuestion(
        prompt: "O que '3 > 7' responde?",
        answerKind: CodeQuestAnswerKind.code,
        codeOptions: ['verdadeiro', 'falso', '10'],
        correctOptionIndex: 1,
        explanation: '3 não é maior que 7, então a comparação é falsa.',
      ),
      CodeQuestQuestion(
        prompt: "O que '4 < 9' responde?",
        answerKind: CodeQuestAnswerKind.code,
        codeOptions: ['verdadeiro', 'falso', '5'],
        correctOptionIndex: 0,
        explanation: '4 é menor que 9, então é verdadeiro.',
      ),
    ],
  ),
  CodeQuestLevel(
    id: 'world4_level6',
    world: 4,
    number: 6,
    title: 'A primeira decisão',
    story: "A porta só abre se o robô tiver moedas suficientes. Hora de usar o primeiro 'se' (if).",
    questions: const [
      CodeQuestQuestion(
        prompt: 'A porta abre?',
        code: [CodeLine('int moedas = 5;'), CodeLine('if (moedas >= 3) {'), CodeLine('  abrirPorta();'), CodeLine('}')],
        answerKind: CodeQuestAnswerKind.code,
        codeOptions: ['Sim, porque 5 >= 3', 'Não, porque falta 1 moeda', 'Não dá pra saber'],
        correctOptionIndex: 0,
        explanation: "'moedas >= 3' é verdadeiro (5 é maior ou igual a 3), então o bloco dentro do 'if' roda e a porta abre.",
      ),
      CodeQuestQuestion(
        prompt: 'E agora, a porta abre?',
        code: [CodeLine('int moedas = 2;'), CodeLine('if (moedas >= 3) {'), CodeLine('  abrirPorta();'), CodeLine('}')],
        answerKind: CodeQuestAnswerKind.code,
        codeOptions: ['Sim', 'Não, porque 2 não é >= 3', 'Não dá pra saber'],
        correctOptionIndex: 1,
        explanation: "'moedas >= 3' é falso (2 é menor que 3) — o código dentro do 'if' não roda.",
      ),
      CodeQuestQuestion(
        prompt: "O que significa 'if' num código?",
        answerKind: CodeQuestAnswerKind.code,
        codeOptions: ["'Repita isso'", "'Se isso for verdade, faça'", "'Pare aqui'"],
        correctOptionIndex: 1,
        explanation: "'if' testa uma condição — só roda o bloco de dentro se a condição for verdadeira.",
      ),
    ],
  ),
  CodeQuestLevel(
    id: 'world4_level7',
    world: 4,
    number: 7,
    title: 'Senão...',
    story: "Quando a condição não vale, o robô precisa de um plano B: o 'senão' (else).",
    questions: const [
      CodeQuestQuestion(
        prompt: 'O que o robô faz?',
        code: [
          CodeLine('int moedas = 1;'),
          CodeLine('if (moedas >= 3) {'),
          CodeLine('  abrirPorta();'),
          CodeLine('} else {'),
          CodeLine('  procurarMoedas();'),
          CodeLine('}'),
        ],
        answerKind: CodeQuestAnswerKind.code,
        codeOptions: ['Abre a porta', 'Procura mais moedas', 'Não faz nada'],
        correctOptionIndex: 1,
        explanation: "'moedas >= 3' é falso (só tem 1), então o bloco do 'else' roda: o robô procura mais moedas.",
      ),
      CodeQuestQuestion(
        prompt: "Quando o bloco do 'else' roda?",
        answerKind: CodeQuestAnswerKind.code,
        codeOptions: ['Sempre, não importa a condição', "Só quando a condição do 'if' é falsa", "Só quando a condição do 'if' é verdadeira"],
        correctOptionIndex: 1,
        explanation: "'else' é o plano B — só roda quando a condição do 'if' deu falso.",
      ),
      CodeQuestQuestion(
        prompt: 'O que acontece?',
        code: [
          CodeLine('int vidas = 0;'),
          CodeLine('if (vidas > 0) {'),
          CodeLine('  continuar();'),
          CodeLine('} else {'),
          CodeLine('  fimDeJogo();'),
          CodeLine('}'),
        ],
        answerKind: CodeQuestAnswerKind.code,
        codeOptions: ['continuar()', 'fimDeJogo()', 'Os dois'],
        correctOptionIndex: 1,
        explanation: "'vidas > 0' é falso (vidas é 0), então roda o 'else': fimDeJogo().",
      ),
      CodeQuestQuestion(
        prompt: 'O que aparece na tela?',
        code: [
          CodeLine('int moedas = 2;'),
          CodeLine('if (moedas >= 5) {'),
          CodeLine('  print("porta aberta");'),
          CodeLine('} else {'),
          CodeLine('  print("junte mais moedas");'),
          CodeLine('}'),
        ],
        answerKind: CodeQuestAnswerKind.code,
        codeOptions: ['porta aberta', 'junte mais moedas', 'Nada aparece'],
        correctOptionIndex: 1,
        explanation: "2 não é maior ou igual a 5, então a condição é falsa e roda o 'else'.",
      ),
    ],
  ),
  CodeQuestLevel(
    id: 'world4_level8',
    world: 4,
    number: 8,
    title: 'Contando com for',
    story: "Em vez de escrever o mesmo comando várias vezes, o robô aprende o laço 'for'.",
    questions: const [
      CodeQuestQuestion(
        prompt: "Quantas vezes 'oi' aparece na tela?",
        code: [CodeLine('for (int i = 0; i < 3; i++) {'), CodeLine('  print("oi");'), CodeLine('}')],
        answerKind: CodeQuestAnswerKind.code,
        codeOptions: ['1 vez', '3 vezes', 'Infinitas vezes'],
        correctOptionIndex: 1,
        explanation: "O 'for' roda enquanto i < 3, começando em 0 — isso é 3 voltas (i = 0, 1, 2).",
      ),
      CodeQuestQuestion(
        prompt: 'Quantas casas o robô anda?',
        code: [CodeLine('for (int i = 0; i < 5; i++) {'), CodeLine('  andar();'), CodeLine('}')],
        answerKind: CodeQuestAnswerKind.code,
        codeOptions: ['3', '4', '5'],
        correctOptionIndex: 2,
        explanation: 'i vai de 0 até 4 (5 valores: 0,1,2,3,4) — são 5 voltas do laço, 5 passos.',
      ),
      CodeQuestQuestion(
        prompt: "O 'for' e o 'Repetir 3×' do labirinto fazem o quê de parecido?",
        answerKind: CodeQuestAnswerKind.code,
        codeOptions: ['Os dois repetem um comando várias vezes', 'Os dois criam uma variável', 'Os dois só funcionam com números pares'],
        correctOptionIndex: 0,
        explanation: "'Repetir'/'for' são a mesma ideia — repetir um comando várias vezes sem reescrever ele.",
      ),
    ],
  ),
  CodeQuestLevel(
    id: 'world4_level9',
    world: 4,
    number: 9,
    title: 'For + if juntos',
    story: 'Agora o robô combina repetição com decisão — como nos mundos anteriores que você já jogou.',
    questions: const [
      CodeQuestQuestion(
        prompt: 'O que aparece na tela?',
        code: [
          CodeLine('for (int i = 1; i <= 4; i++) {'),
          CodeLine('  if (i % 2 == 0) {'),
          CodeLine('    print(i);'),
          CodeLine('  }'),
          CodeLine('}'),
        ],
        answerKind: CodeQuestAnswerKind.code,
        codeOptions: ['1 2 3 4', '2 4', '1 3'],
        correctOptionIndex: 1,
        explanation: "'i % 2 == 0' só é verdade pros números pares — de 1 a 4, os pares são 2 e 4.",
      ),
      CodeQuestQuestion(
        prompt: "O que 'i % 2' calcula?",
        answerKind: CodeQuestAnswerKind.code,
        codeOptions: ['O resto da divisão de i por 2', 'O dobro de i', 'A metade de i'],
        correctOptionIndex: 0,
        explanation: "'%' é o operador de resto — 'i % 2' dá 0 se i é par, e 1 se i é ímpar.",
      ),
      CodeQuestQuestion(
        prompt: "Quanto vale 'total' no final?",
        code: [CodeLine('int total = 0;'), CodeLine('for (int i = 1; i <= 3; i++) {'), CodeLine('  total = total + i;'), CodeLine('}')],
        answerKind: CodeQuestAnswerKind.code,
        codeOptions: ['3', '6', '1'],
        correctOptionIndex: 1,
        explanation: "O laço soma 1 + 2 + 3 = 6 em 'total'.",
      ),
      CodeQuestQuestion(
        prompt: 'Isso lembra qual combinação de blocos?',
        answerKind: CodeQuestAnswerKind.code,
        codeOptions: ["'Para cada número' + um bloco-alvo condicional", "'Andar' sozinho", "'Virar Esquerda' sozinho"],
        correctOptionIndex: 0,
        explanation: "'Para cada número' + bloco-alvo é exatamente essa ideia: repetir uma soma pra cada item de uma lista, só quando a condição bate.",
      ),
    ],
  ),
  CodeQuestLevel(
    id: 'world4_level10',
    world: 4,
    number: 10,
    title: 'Achando o erro',
    story: 'Um bug se escondeu no código do robô! Ajude a encontrar a linha errada.',
    questions: const [
      CodeQuestQuestion(
        prompt: "O código deveria somar 1+2+3 = 6, mas isso não vai acontecer. Qual linha tem o erro?",
        code: [
          CodeLine('int total = 0;'),
          CodeLine('for (int i = 1; i <= 3; i++) {'),
          CodeLine('  total = total - i;'),
          CodeLine('}'),
          CodeLine('print(total);'),
        ],
        answerKind: CodeQuestAnswerKind.code,
        codeOptions: ["'int total = 0;'", "'total = total - i;' (deveria ser +)", "'print(total);'"],
        correctOptionIndex: 1,
        explanation: "O código usa '-' (subtração) em vez de '+' (soma) — por isso 'total' fica negativo em vez de somar.",
      ),
      CodeQuestQuestion(
        prompt: 'Esse código tem um erro de sintaxe. Qual é?',
        code: [CodeLine('int x = 5'), CodeLine('print(x);')],
        answerKind: CodeQuestAnswerKind.code,
        codeOptions: ["Falta o ponto e vírgula (;) depois de '5'", 'Falta o nome da variável', "'print' está escrito errado"],
        correctOptionIndex: 0,
        explanation: "Toda linha de comando em Dart termina com ';' — sem ele, o código não compila.",
      ),
      CodeQuestQuestion(
        prompt: "Esse 'if' está com um erro comum. Qual é?",
        code: [CodeLine('if (vidas = 3) {'), CodeLine('  continuar();'), CodeLine('}')],
        answerKind: CodeQuestAnswerKind.code,
        codeOptions: ["Usou '=' (atribuir) em vez de '==' (comparar)", "Esqueceu a chave '{'", 'Está tudo certo'],
        correctOptionIndex: 0,
        explanation: "'=' atribui um valor; '==' compara dois valores. Dentro de um 'if' é preciso comparar, então o certo é '=='.",
      ),
    ],
  ),
  CodeQuestLevel(
    id: 'world4_level11',
    world: 4,
    number: 11,
    title: 'Lendo um código maior',
    story: 'Perto do fim da missão, o robô encontra um painel com um código mais longo. Leia com calma.',
    questions: const [
      CodeQuestQuestion(
        prompt: 'O que aparece na tela?',
        code: [
          CodeLine('int total = 0;'),
          CodeLine('for (int i = 1; i <= 4; i++) {'),
          CodeLine('  if (i % 2 == 0) {'),
          CodeLine('    total = total + i;'),
          CodeLine('  }'),
          CodeLine('}'),
          CodeLine('print(total);'),
        ],
        answerKind: CodeQuestAnswerKind.code,
        codeOptions: ['6', '10', '4'],
        correctOptionIndex: 0,
        explanation: 'Só os pares (2 e 4) entram na soma: 2 + 4 = 6.',
      ),
      CodeQuestQuestion(
        prompt: 'E aqui, o que aparece?',
        code: [
          CodeLine('int contador = 0;'),
          CodeLine('for (int i = 1; i <= 5; i++) {'),
          CodeLine('  if (i % 2 != 0) {'),
          CodeLine('    contador = contador + 1;'),
          CodeLine('  }'),
          CodeLine('}'),
          CodeLine('print(contador);'),
        ],
        answerKind: CodeQuestAnswerKind.code,
        codeOptions: ['2', '3', '5'],
        correctOptionIndex: 1,
        explanation: "Os ímpares de 1 a 5 são 1, 3 e 5 — três números, então 'contador' termina em 3.",
      ),
      CodeQuestQuestion(
        prompt: "'!=' significa o quê?",
        answerKind: CodeQuestAnswerKind.code,
        codeOptions: ["'diferente de'", "'igual a'", "'maior que'"],
        correctOptionIndex: 0,
        explanation: "'!=' é o oposto de '==' — compara se dois valores são diferentes.",
      ),
      CodeQuestQuestion(
        prompt: 'O que aparece?',
        code: [
          CodeLine('int x = 10;'),
          CodeLine('if (x > 5) {'),
          CodeLine('  print("grande");'),
          CodeLine('} else {'),
          CodeLine('  print("pequeno");'),
          CodeLine('}'),
        ],
        answerKind: CodeQuestAnswerKind.code,
        codeOptions: ['grande', 'pequeno', 'Os dois'],
        correctOptionIndex: 0,
        explanation: "x é 10, que é maior que 5 — a condição do 'if' é verdadeira, então imprime 'grande'.",
      ),
    ],
  ),
  CodeQuestLevel(
    id: 'world4_level12',
    world: 4,
    number: 12,
    title: 'Fim da Missão',
    story: 'Último desafio! O robô está na porta final — acerte tudo para completar a Missão de Código.',
    questions: const [
      CodeQuestQuestion(
        prompt: "Quanto vale 'total' no final?",
        code: [
          CodeLine('int total = 0;'),
          CodeLine('for (int i = 1; i <= 6; i++) {'),
          CodeLine('  if (i % 2 == 0) {'),
          CodeLine('    total = total + i;'),
          CodeLine('  }'),
          CodeLine('}'),
        ],
        answerKind: CodeQuestAnswerKind.code,
        codeOptions: ['12', '9', '6'],
        correctOptionIndex: 0,
        explanation: 'Pares de 1 a 6: 2 + 4 + 6 = 12.',
      ),
      CodeQuestQuestion(
        prompt: "Quanto vale 'contador'?",
        code: [
          CodeLine('int contador = 0;'),
          CodeLine('for (int i = 1; i <= 7; i++) {'),
          CodeLine('  if (i % 2 != 0) {'),
          CodeLine('    contador = contador + 1;'),
          CodeLine('  }'),
          CodeLine('}'),
        ],
        answerKind: CodeQuestAnswerKind.code,
        codeOptions: ['3', '4', '7'],
        correctOptionIndex: 1,
        explanation: 'Ímpares de 1 a 7: 1, 3, 5, 7 — quatro números.',
      ),
      CodeQuestQuestion(
        prompt: "No labirinto, qual bloco você combinaria com 'Repetir 3×' pra resgatar vários personagens de uma vez?",
        answerKind: CodeQuestAnswerKind.blockIcon,
        blockOptions: [BlockType.turnLeft, BlockType.walk, BlockType.turnRight],
        correctOptionIndex: 1,
        explanation: "'Repetir 3×' + 'Andar' percorre 3 casas de uma vez, e quem estiver no caminho é resgatado na hora.",
      ),
      CodeQuestQuestion(
        prompt: 'Última pergunta: o que aparece?',
        code: [
          CodeLine('int x = 4;'),
          CodeLine('if (x == 4) {'),
          CodeLine('  print("achou");'),
          CodeLine('} else {'),
          CodeLine('  print("nada");'),
          CodeLine('}'),
        ],
        answerKind: CodeQuestAnswerKind.code,
        codeOptions: ['achou', 'nada', 'erro'],
        correctOptionIndex: 0,
        explanation: "x é 4, e '4 == 4' é verdadeiro — o 'if' roda e imprime 'achou'. Missão completa!",
      ),
    ],
  ),
];
