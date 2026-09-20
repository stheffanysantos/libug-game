// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_quest_gameplay_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// ViewModel da Gameplay do Mundo 4 ("Missão de Código") — sem passo a
/// passo/grid (diferente de `GameplayViewModel`): cada `confirm()` avança
/// ou não o cursor de pergunta conforme `checkCodeQuestAnswer`
/// (`lib/game/code_quest_progress.dart`). Família por `levelId`.

@ProviderFor(CodeQuestGameplayViewModel)
const codeQuestGameplayViewModelProvider = CodeQuestGameplayViewModelFamily._();

/// ViewModel da Gameplay do Mundo 4 ("Missão de Código") — sem passo a
/// passo/grid (diferente de `GameplayViewModel`): cada `confirm()` avança
/// ou não o cursor de pergunta conforme `checkCodeQuestAnswer`
/// (`lib/game/code_quest_progress.dart`). Família por `levelId`.
final class CodeQuestGameplayViewModelProvider
    extends
        $NotifierProvider<CodeQuestGameplayViewModel, CodeQuestGameplayState> {
  /// ViewModel da Gameplay do Mundo 4 ("Missão de Código") — sem passo a
  /// passo/grid (diferente de `GameplayViewModel`): cada `confirm()` avança
  /// ou não o cursor de pergunta conforme `checkCodeQuestAnswer`
  /// (`lib/game/code_quest_progress.dart`). Família por `levelId`.
  const CodeQuestGameplayViewModelProvider._({
    required CodeQuestGameplayViewModelFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'codeQuestGameplayViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$codeQuestGameplayViewModelHash();

  @override
  String toString() {
    return r'codeQuestGameplayViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CodeQuestGameplayViewModel create() => CodeQuestGameplayViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CodeQuestGameplayState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CodeQuestGameplayState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CodeQuestGameplayViewModelProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$codeQuestGameplayViewModelHash() =>
    r'bc47175504f656286ef71d6ec9e3aad6c5f15829';

/// ViewModel da Gameplay do Mundo 4 ("Missão de Código") — sem passo a
/// passo/grid (diferente de `GameplayViewModel`): cada `confirm()` avança
/// ou não o cursor de pergunta conforme `checkCodeQuestAnswer`
/// (`lib/game/code_quest_progress.dart`). Família por `levelId`.

final class CodeQuestGameplayViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          CodeQuestGameplayViewModel,
          CodeQuestGameplayState,
          CodeQuestGameplayState,
          CodeQuestGameplayState,
          String
        > {
  const CodeQuestGameplayViewModelFamily._()
    : super(
        retry: null,
        name: r'codeQuestGameplayViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// ViewModel da Gameplay do Mundo 4 ("Missão de Código") — sem passo a
  /// passo/grid (diferente de `GameplayViewModel`): cada `confirm()` avança
  /// ou não o cursor de pergunta conforme `checkCodeQuestAnswer`
  /// (`lib/game/code_quest_progress.dart`). Família por `levelId`.

  CodeQuestGameplayViewModelProvider call(String levelId) =>
      CodeQuestGameplayViewModelProvider._(argument: levelId, from: this);

  @override
  String toString() => r'codeQuestGameplayViewModelProvider';
}

/// ViewModel da Gameplay do Mundo 4 ("Missão de Código") — sem passo a
/// passo/grid (diferente de `GameplayViewModel`): cada `confirm()` avança
/// ou não o cursor de pergunta conforme `checkCodeQuestAnswer`
/// (`lib/game/code_quest_progress.dart`). Família por `levelId`.

abstract class _$CodeQuestGameplayViewModel
    extends $Notifier<CodeQuestGameplayState> {
  late final _$args = ref.$arg as String;
  String get levelId => _$args;

  CodeQuestGameplayState build(String levelId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref as $Ref<CodeQuestGameplayState, CodeQuestGameplayState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CodeQuestGameplayState, CodeQuestGameplayState>,
              CodeQuestGameplayState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
