// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_puzzle_gameplay_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// ViewModel da Gameplay do Mundo 7 ("Modo Debug") — mesma forma de
/// `PredictOutputGameplayViewModel`/`CompleteCodeGameplayViewModel`: sem
/// passo a passo, cada `confirm()` é um veredito único. Família por
/// `levelId`.

@ProviderFor(CodePuzzleGameplayViewModel)
const codePuzzleGameplayViewModelProvider =
    CodePuzzleGameplayViewModelFamily._();

/// ViewModel da Gameplay do Mundo 7 ("Modo Debug") — mesma forma de
/// `PredictOutputGameplayViewModel`/`CompleteCodeGameplayViewModel`: sem
/// passo a passo, cada `confirm()` é um veredito único. Família por
/// `levelId`.
final class CodePuzzleGameplayViewModelProvider
    extends
        $NotifierProvider<
          CodePuzzleGameplayViewModel,
          CodePuzzleGameplayState
        > {
  /// ViewModel da Gameplay do Mundo 7 ("Modo Debug") — mesma forma de
  /// `PredictOutputGameplayViewModel`/`CompleteCodeGameplayViewModel`: sem
  /// passo a passo, cada `confirm()` é um veredito único. Família por
  /// `levelId`.
  const CodePuzzleGameplayViewModelProvider._({
    required CodePuzzleGameplayViewModelFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'codePuzzleGameplayViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$codePuzzleGameplayViewModelHash();

  @override
  String toString() {
    return r'codePuzzleGameplayViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CodePuzzleGameplayViewModel create() => CodePuzzleGameplayViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CodePuzzleGameplayState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CodePuzzleGameplayState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CodePuzzleGameplayViewModelProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$codePuzzleGameplayViewModelHash() =>
    r'60f07f0d9279aa00b7858e804da5f1945031ceec';

/// ViewModel da Gameplay do Mundo 7 ("Modo Debug") — mesma forma de
/// `PredictOutputGameplayViewModel`/`CompleteCodeGameplayViewModel`: sem
/// passo a passo, cada `confirm()` é um veredito único. Família por
/// `levelId`.

final class CodePuzzleGameplayViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          CodePuzzleGameplayViewModel,
          CodePuzzleGameplayState,
          CodePuzzleGameplayState,
          CodePuzzleGameplayState,
          String
        > {
  const CodePuzzleGameplayViewModelFamily._()
    : super(
        retry: null,
        name: r'codePuzzleGameplayViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// ViewModel da Gameplay do Mundo 7 ("Modo Debug") — mesma forma de
  /// `PredictOutputGameplayViewModel`/`CompleteCodeGameplayViewModel`: sem
  /// passo a passo, cada `confirm()` é um veredito único. Família por
  /// `levelId`.

  CodePuzzleGameplayViewModelProvider call(String levelId) =>
      CodePuzzleGameplayViewModelProvider._(argument: levelId, from: this);

  @override
  String toString() => r'codePuzzleGameplayViewModelProvider';
}

/// ViewModel da Gameplay do Mundo 7 ("Modo Debug") — mesma forma de
/// `PredictOutputGameplayViewModel`/`CompleteCodeGameplayViewModel`: sem
/// passo a passo, cada `confirm()` é um veredito único. Família por
/// `levelId`.

abstract class _$CodePuzzleGameplayViewModel
    extends $Notifier<CodePuzzleGameplayState> {
  late final _$args = ref.$arg as String;
  String get levelId => _$args;

  CodePuzzleGameplayState build(String levelId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref as $Ref<CodePuzzleGameplayState, CodePuzzleGameplayState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CodePuzzleGameplayState, CodePuzzleGameplayState>,
              CodePuzzleGameplayState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
