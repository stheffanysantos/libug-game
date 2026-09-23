// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'predict_output_gameplay_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// ViewModel da Gameplay do Mundo 5 ("Preveja a Saída") — sem passo a passo
/// (diferente de `GameplayViewModel`/`ConveyorGameplayViewModel`): cada
/// `confirm()` é um veredito único, calculado na hora a partir da opção
/// escolhida. Família por `levelId`.

@ProviderFor(PredictOutputGameplayViewModel)
const predictOutputGameplayViewModelProvider =
    PredictOutputGameplayViewModelFamily._();

/// ViewModel da Gameplay do Mundo 5 ("Preveja a Saída") — sem passo a passo
/// (diferente de `GameplayViewModel`/`ConveyorGameplayViewModel`): cada
/// `confirm()` é um veredito único, calculado na hora a partir da opção
/// escolhida. Família por `levelId`.
final class PredictOutputGameplayViewModelProvider
    extends
        $NotifierProvider<
          PredictOutputGameplayViewModel,
          PredictOutputGameplayState
        > {
  /// ViewModel da Gameplay do Mundo 5 ("Preveja a Saída") — sem passo a passo
  /// (diferente de `GameplayViewModel`/`ConveyorGameplayViewModel`): cada
  /// `confirm()` é um veredito único, calculado na hora a partir da opção
  /// escolhida. Família por `levelId`.
  const PredictOutputGameplayViewModelProvider._({
    required PredictOutputGameplayViewModelFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'predictOutputGameplayViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$predictOutputGameplayViewModelHash();

  @override
  String toString() {
    return r'predictOutputGameplayViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PredictOutputGameplayViewModel create() => PredictOutputGameplayViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PredictOutputGameplayState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PredictOutputGameplayState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PredictOutputGameplayViewModelProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$predictOutputGameplayViewModelHash() =>
    r'7529c71c77c44d6e516c2e84a99773e3117237c9';

/// ViewModel da Gameplay do Mundo 5 ("Preveja a Saída") — sem passo a passo
/// (diferente de `GameplayViewModel`/`ConveyorGameplayViewModel`): cada
/// `confirm()` é um veredito único, calculado na hora a partir da opção
/// escolhida. Família por `levelId`.

final class PredictOutputGameplayViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          PredictOutputGameplayViewModel,
          PredictOutputGameplayState,
          PredictOutputGameplayState,
          PredictOutputGameplayState,
          String
        > {
  const PredictOutputGameplayViewModelFamily._()
    : super(
        retry: null,
        name: r'predictOutputGameplayViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// ViewModel da Gameplay do Mundo 5 ("Preveja a Saída") — sem passo a passo
  /// (diferente de `GameplayViewModel`/`ConveyorGameplayViewModel`): cada
  /// `confirm()` é um veredito único, calculado na hora a partir da opção
  /// escolhida. Família por `levelId`.

  PredictOutputGameplayViewModelProvider call(String levelId) =>
      PredictOutputGameplayViewModelProvider._(argument: levelId, from: this);

  @override
  String toString() => r'predictOutputGameplayViewModelProvider';
}

/// ViewModel da Gameplay do Mundo 5 ("Preveja a Saída") — sem passo a passo
/// (diferente de `GameplayViewModel`/`ConveyorGameplayViewModel`): cada
/// `confirm()` é um veredito único, calculado na hora a partir da opção
/// escolhida. Família por `levelId`.

abstract class _$PredictOutputGameplayViewModel
    extends $Notifier<PredictOutputGameplayState> {
  late final _$args = ref.$arg as String;
  String get levelId => _$args;

  PredictOutputGameplayState build(String levelId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref
            as $Ref<PredictOutputGameplayState, PredictOutputGameplayState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                PredictOutputGameplayState,
                PredictOutputGameplayState
              >,
              PredictOutputGameplayState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
