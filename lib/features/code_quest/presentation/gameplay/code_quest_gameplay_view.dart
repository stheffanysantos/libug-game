import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/auth/auth_providers.dart';
import '../../../../core/onboarding/onboarding_notifier.dart';
import '../../../../models/block.dart';
import '../../../../models/code_quest_level.dart';
import '../../../../models/game_track.dart';
import '../../../auth/presentation/register/register_view.dart';
import '../../../tutorial/presentation/tutorial_view.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_text.dart';
import '../../../../widgets/block_chip_style.dart';
import '../../../../widgets/code_syntax_highlight.dart';
import '../../../../widgets/gameplay_header_widget.dart';
import '../../../../widgets/mascot_image_widget.dart';
import '../../../../widgets/primary_pill_button_widget.dart';
import '../../../../widgets/pulse_tap_widget.dart';
import '../../../../widgets/selectable_line_tile_widget.dart';
import '../../../../widgets/tutorial_content.dart';
import '../../../result/presentation/code_puzzle_result_view.dart';
import '../stage_select/stage_select_view.dart';
import 'code_quest_gameplay_state.dart';
import 'code_quest_gameplay_view_model.dart';

/// Volta pra Seleção de Fases — a menos que o Mundo que acabou de fechar
/// agora seja o último da Trilha 1 e o jogador ainda não tenha conta, caso
/// em que empurra `RegisterView` primeiro (gate de fim de Trilha, ver
/// `.claude/memory/decisions.md`). Mesmo padrão dos outros mundos.
void _returnToLevelSelect(BuildContext context, WidgetRef ref, {required int worldNumber, required bool worldJustCompleted}) {
  final isEndOfTrack1 = worldJustCompleted && worldNumber == tracks.first.worlds.last.number;
  if (isEndOfTrack1 && !ref.read(authServiceProvider).hasAccount) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => RegisterView(
        mandatory: true,
        onDone: () => Navigator.of(context).popUntil((route) => route.settings.name == codeQuestStageSelectRouteName),
      ),
    ));
    return;
  }
  Navigator.of(context).popUntil((route) => route.settings.name == codeQuestStageSelectRouteName);
}

/// Chamado pelo botão primário da `CodePuzzleResultView` numa vitória —
/// decide entre jogar a próxima fase direto, mostrar a recapitulação de fim
/// de Mundo, ou voltar direto pra Seleção de Fases.
void _onResultPrimaryAction(BuildContext context, WidgetRef ref, CodeQuestResultData data) {
  if (data.nextLevel != null) {
    Navigator.of(context).popUntil((route) => route.settings.name == codeQuestStageSelectRouteName);
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => CodeQuestGameplayView(levelId: data.nextLevel!.id)));
    return;
  }
  if (data.worldJustCompleted && !ref.read(onboardingProvider).hasSeenRecap(data.worldNumber)) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => TutorialView(
        slides: recapSlidesFor(data.worldNumber),
        finalLabel: 'Concluir',
        onFinish: () {
          ref.read(onboardingProvider.notifier).markRecapSeen(data.worldNumber);
          _returnToLevelSelect(context, ref, worldNumber: data.worldNumber, worldJustCompleted: data.worldJustCompleted);
        },
      ),
    ));
    return;
  }
  _returnToLevelSelect(context, ref, worldNumber: data.worldNumber, worldJustCompleted: data.worldJustCompleted);
}

/// Gameplay do Mundo 4 ("Missão de Código") — uma histórinha curta + uma
/// sequência de perguntas de múltipla escolha (A/B/C/D) sobre código; cada
/// resposta certa avança o Mascote 1 passo num caminho linear simples (sem
/// grid/parede). Sem execução passo a passo de verdade — cada "Confirmar"
/// é um veredito por pergunta, e a fase nunca tem "Falha": errar só soma
/// tentativa e mostra o feedback inline, sem sair da tela. Ver
/// `.claude/docs/GAME_DESIGN.md`.
///
/// `ConsumerStatefulWidget` só pra guardar as `GlobalKey`s da fila de
/// perguntas do caminho — estado puramente de apresentação (mesmo padrão
/// de `ConveyorGameplayView`/`BlockProgramGameplayView`), a lógica de
/// verdade continua inteira em `CodeQuestGameplayViewModel`.
class CodeQuestGameplayView extends ConsumerStatefulWidget {
  final String levelId;

  const CodeQuestGameplayView({super.key, required this.levelId});

  @override
  ConsumerState<CodeQuestGameplayView> createState() => _CodeQuestGameplayViewState();
}

class _CodeQuestGameplayViewState extends ConsumerState<CodeQuestGameplayView> {
  final Map<int, GlobalKey> _questionKeys = {};

  GlobalKey _keyFor(int index) => _questionKeys.putIfAbsent(index, () => GlobalKey());

  void _scrollToCurrent(int index) {
    final itemContext = _questionKeys[index]?.currentContext;
    if (itemContext == null) return;
    Scrollable.ensureVisible(itemContext, duration: const Duration(milliseconds: 250), alignment: 0.5);
  }

  Future<void> _handleEffect(BuildContext context, WidgetRef ref, CodeQuestGameplayEffect effect) async {
    final notifier = ref.read(codeQuestGameplayViewModelProvider(widget.levelId).notifier);
    notifier.clearEffect();
    switch (effect) {
      case ShowCodeQuestResult(:final data):
        await Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => CodePuzzleResultView(
            won: true,
            levelNumber: data.levelNumber,
            attempts: data.attempts,
            stars: data.stars,
            points: data.points,
            hasNext: data.nextLevel != null,
            onPrimaryAction: () => _onResultPrimaryAction(context, ref, data),
            onBackToMenu: () => Navigator.of(context).popUntil((route) => route.settings.name == codeQuestStageSelectRouteName),
            onReplaySameLevel: notifier.resetForReplay,
          ),
        ));
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<CodeQuestGameplayState>(codeQuestGameplayViewModelProvider(widget.levelId), (previous, next) {
      final effect = next.pendingEffect;
      if (effect != null) _handleEffect(context, ref, effect);
      if (previous != null && previous.currentQuestionIndex != next.currentQuestionIndex) {
        WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToCurrent(next.currentQuestionIndex));
      }
    });

    final state = ref.watch(codeQuestGameplayViewModelProvider(widget.levelId));
    final notifier = ref.read(codeQuestGameplayViewModelProvider(widget.levelId).notifier);
    final level = state.level;
    final question = state.currentQuestion;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 10, 18, 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameplayHeader(
                  levelNumber: level.number,
                  title: level.title,
                  trailingChipText: 'Passo ${state.currentQuestionIndex + 1} / ${level.questions.length}',
                  onBack: () => Navigator.of(context).pop(),
                ),
                const SizedBox(height: 14),
                _buildStoryCard(level),
                const SizedBox(height: 14),
                _buildPath(state),
                const SizedBox(height: 14),
                if (question.code.isNotEmpty) ...[
                  _buildCodeCard(question),
                  const SizedBox(height: 14),
                ],
                Text(question.prompt, style: AppText.style(size: 17, weight: FontWeight.w900, color: AppColors.white)),
                const SizedBox(height: 10),
                for (var i = 0; i < question.optionCount; i++) _buildOption(context, state, notifier, question, i),
                if (state.showWrongFeedback) ...[
                  const SizedBox(height: 4),
                  _buildWrongFeedback(question.explanation),
                ],
                const SizedBox(height: 8),
                PrimaryPillButton(
                  label: 'Confirmar',
                  height: 64,
                  fontSize: 24,
                  enabled: state.selectedOptionIndex != null,
                  onTap: notifier.confirm,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStoryCard(CodeQuestLevel level) {
    return Container(
      key: const Key('codeQuestStoryCard'),
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: AppColors.panel, borderRadius: BorderRadius.circular(22)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('HISTÓRIA', style: AppText.eyebrow(size: 11)),
          const SizedBox(height: 8),
          Text(level.story, style: AppText.style(size: 14, weight: FontWeight.w800, color: AppColors.white, height: 1.4)),
        ],
      ),
    );
  }

  /// O caminho linear da Missão: fila horizontal de círculos, 1 por
  /// pergunta — o Mascote aparece no círculo do passo atual (pulsando,
  /// mesmo motivo visual do Item atual de outros mundos), passos já
  /// respondidos ganham um "✓", passos futuros ficam neutros. Sem
  /// grid/parede — só avanço linear, mesma técnica de fila rolável já
  /// usada por `ConveyorGameplayView`/`BlockProgramGameplayView`
  /// (`Scrollable.ensureVisible` via `GlobalKey` por item).
  Widget _buildPath(CodeQuestGameplayState state) {
    final level = state.level;
    return SizedBox(
      key: const Key('codeQuestPath'),
      height: 64,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: level.questions.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) => KeyedSubtree(
          key: _keyFor(index),
          child: Center(child: _buildPathNode(state, index)),
        ),
      ),
    );
  }

  Widget _buildPathNode(CodeQuestGameplayState state, int index) {
    final isCurrent = index == state.currentQuestionIndex;
    final isDone = index < state.currentQuestionIndex;

    final node = Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: isDone ? AppColors.purple : AppColors.lilac,
        shape: BoxShape.circle,
        border: isCurrent ? Border.all(color: AppColors.white, width: 3) : null,
        boxShadow: isCurrent
            ? [BoxShadow(color: AppColors.lilac.withValues(alpha: 0.35), blurRadius: 0, spreadRadius: 5)]
            : const [],
      ),
      alignment: Alignment.center,
      child: isCurrent
          ? const MascotImage(size: 40)
          : isDone
              ? const Icon(Icons.check, color: AppColors.white)
              : Text('${index + 1}', style: AppText.style(size: 16, weight: FontWeight.w900, color: AppColors.purpleDark)),
    );

    return isCurrent ? PulseTap(child: node) : node;
  }

  Widget _buildCodeCard(CodeQuestQuestion question) {
    return Container(
      key: const Key('codeQuestCodeCard'),
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.panel,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.grayButton, width: 3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('CÓDIGO', style: AppText.eyebrow(size: 11)),
          const SizedBox(height: 10),
          for (final line in question.code)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: RichText(text: TextSpan(children: highlightCodeLine(line.text))),
            ),
        ],
      ),
    );
  }

  Widget _buildOption(
    BuildContext context,
    CodeQuestGameplayState state,
    CodeQuestGameplayViewModel notifier,
    CodeQuestQuestion question,
    int index,
  ) {
    if (question.answerKind == CodeQuestAnswerKind.blockIcon) {
      final style = styleForBlock(Block(question.blockOptions[index]));
      return SelectableLineTile(
        key: Key('codeQuestOption_$index'),
        selected: state.selectedOptionIndex == index,
        onTap: () => notifier.selectOption(index),
        child: Row(
          children: [
            style.icon(24),
            const SizedBox(width: 10),
            Text(style.label, style: AppText.style(size: 16, weight: FontWeight.w800, color: AppColors.white)),
          ],
        ),
      );
    }

    return SelectableLineTile(
      key: Key('codeQuestOption_$index'),
      selected: state.selectedOptionIndex == index,
      onTap: () => notifier.selectOption(index),
      label: '${String.fromCharCode(97 + index)})',
      child: Text(
        question.codeOptions[index],
        style: AppText.style(size: 16, weight: FontWeight.w800, color: AppColors.white),
      ),
    );
  }

  /// Feedback inline de resposta errada — nunca navega pra fora desta
  /// tela (diferente dos Mundos 5/6/7, que mostram a explicação na tela de
  /// derrota); aqui não existe derrota, então a explicação aparece direto
  /// abaixo das opções, e o jogador tenta de novo sem sair do lugar.
  Widget _buildWrongFeedback(String explanation) {
    return Container(
      key: const Key('codeQuestWrongFeedback'),
      width: double.infinity,
      margin: const EdgeInsets.only(top: 4, bottom: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.panel,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.purple, width: 2),
      ),
      child: Text(explanation, style: AppText.style(size: 14, weight: FontWeight.w800, color: AppColors.white, height: 1.4)),
    );
  }
}
