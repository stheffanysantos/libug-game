// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_code_gameplay_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// ViewModel da Gameplay do Mundo 6 ("Complete o Código") — mesma forma de
/// `PredictOutputGameplayViewModel` (Mundo 5): sem passo a passo, cada
/// `confirm()` é um veredito único. Família por `levelId`.

@ProviderFor(CompleteCodeGameplayViewModel)
const completeCodeGameplayViewModelProvider =
    CompleteCodeGameplayViewModelFamily._();

/// ViewModel da Gameplay do Mundo 6 ("Complete o Código") — mesma forma de
/// `PredictOutputGameplayViewModel` (Mundo 5): sem passo a passo, cada
/// `confirm()` é um veredito único. Família por `levelId`.
final class CompleteCodeGameplayViewModelProvider
    extends
        $NotifierProvider<
          CompleteCodeGameplayViewModel,
          CompleteCodeGameplayState
        > {
  /// ViewModel da Gameplay do Mundo 6 ("Complete o Código") — mesma forma de
  /// `PredictOutputGameplayViewModel` (Mundo 5): sem passo a passo, cada
  /// `confirm()` é um veredito único. Família por `levelId`.
  const CompleteCodeGameplayViewModelProvider._({
    required CompleteCodeGameplayViewModelFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'completeCodeGameplayViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$completeCodeGameplayViewModelHash();

  @override
  String toString() {
    return r'completeCodeGameplayViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CompleteCodeGameplayViewModel create() => CompleteCodeGameplayViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CompleteCodeGameplayState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CompleteCodeGameplayState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CompleteCodeGameplayViewModelProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$completeCodeGameplayViewModelHash() =>
    r'a9cefa2db8e998f804cab3f1df35c728ea08e598';

/// ViewModel da Gameplay do Mundo 6 ("Complete o Código") — mesma forma de
/// `PredictOutputGameplayViewModel` (Mundo 5): sem passo a passo, cada
/// `confirm()` é um veredito único. Família por `levelId`.

final class CompleteCodeGameplayViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          CompleteCodeGameplayViewModel,
          CompleteCodeGameplayState,
          CompleteCodeGameplayState,
          CompleteCodeGameplayState,
          String
        > {
  const CompleteCodeGameplayViewModelFamily._()
    : super(
        retry: null,
        name: r'completeCodeGameplayViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// ViewModel da Gameplay do Mundo 6 ("Complete o Código") — mesma forma de
  /// `PredictOutputGameplayViewModel` (Mundo 5): sem passo a passo, cada
  /// `confirm()` é um veredito único. Família por `levelId`.

  CompleteCodeGameplayViewModelProvider call(String levelId) =>
      CompleteCodeGameplayViewModelProvider._(argument: levelId, from: this);

  @override
  String toString() => r'completeCodeGameplayViewModelProvider';
}

/// ViewModel da Gameplay do Mundo 6 ("Complete o Código") — mesma forma de
/// `PredictOutputGameplayViewModel` (Mundo 5): sem passo a passo, cada
/// `confirm()` é um veredito único. Família por `levelId`.

abstract class _$CompleteCodeGameplayViewModel
    extends $Notifier<CompleteCodeGameplayState> {
  late final _$args = ref.$arg as String;
  String get levelId => _$args;

  CompleteCodeGameplayState build(String levelId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref as $Ref<CompleteCodeGameplayState, CompleteCodeGameplayState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CompleteCodeGameplayState, CompleteCodeGameplayState>,
              CompleteCodeGameplayState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
