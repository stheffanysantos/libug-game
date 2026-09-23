// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gameplay_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// ViewModel da Gameplay do Mundo 1 — família por `levelId` (não pelo objeto
/// `Level`, que não tem `==`/`hashCode` de valor). Orquestra a Execução
/// (`ProgramExecutor`) passo a passo, incluindo o timing da animação (mesmo
/// lugar de antes, dentro de `_run()`/`_goToResultScreen` do antigo
/// `GameplayScreen`) — a View só renderiza `state` e reage a
/// `state.pendingEffect` via `ref.listen`.

@ProviderFor(GameplayViewModel)
const gameplayViewModelProvider = GameplayViewModelFamily._();

/// ViewModel da Gameplay do Mundo 1 — família por `levelId` (não pelo objeto
/// `Level`, que não tem `==`/`hashCode` de valor). Orquestra a Execução
/// (`ProgramExecutor`) passo a passo, incluindo o timing da animação (mesmo
/// lugar de antes, dentro de `_run()`/`_goToResultScreen` do antigo
/// `GameplayScreen`) — a View só renderiza `state` e reage a
/// `state.pendingEffect` via `ref.listen`.
final class GameplayViewModelProvider
    extends $NotifierProvider<GameplayViewModel, GameplayState> {
  /// ViewModel da Gameplay do Mundo 1 — família por `levelId` (não pelo objeto
  /// `Level`, que não tem `==`/`hashCode` de valor). Orquestra a Execução
  /// (`ProgramExecutor`) passo a passo, incluindo o timing da animação (mesmo
  /// lugar de antes, dentro de `_run()`/`_goToResultScreen` do antigo
  /// `GameplayScreen`) — a View só renderiza `state` e reage a
  /// `state.pendingEffect` via `ref.listen`.
  const GameplayViewModelProvider._({
    required GameplayViewModelFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'gameplayViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$gameplayViewModelHash();

  @override
  String toString() {
    return r'gameplayViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  GameplayViewModel create() => GameplayViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GameplayState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GameplayState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GameplayViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$gameplayViewModelHash() => r'6403747d804da5acb16adecfcd6dd4428289d7da';

/// ViewModel da Gameplay do Mundo 1 — família por `levelId` (não pelo objeto
/// `Level`, que não tem `==`/`hashCode` de valor). Orquestra a Execução
/// (`ProgramExecutor`) passo a passo, incluindo o timing da animação (mesmo
/// lugar de antes, dentro de `_run()`/`_goToResultScreen` do antigo
/// `GameplayScreen`) — a View só renderiza `state` e reage a
/// `state.pendingEffect` via `ref.listen`.

final class GameplayViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          GameplayViewModel,
          GameplayState,
          GameplayState,
          GameplayState,
          String
        > {
  const GameplayViewModelFamily._()
    : super(
        retry: null,
        name: r'gameplayViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// ViewModel da Gameplay do Mundo 1 — família por `levelId` (não pelo objeto
  /// `Level`, que não tem `==`/`hashCode` de valor). Orquestra a Execução
  /// (`ProgramExecutor`) passo a passo, incluindo o timing da animação (mesmo
  /// lugar de antes, dentro de `_run()`/`_goToResultScreen` do antigo
  /// `GameplayScreen`) — a View só renderiza `state` e reage a
  /// `state.pendingEffect` via `ref.listen`.

  GameplayViewModelProvider call(String levelId) =>
      GameplayViewModelProvider._(argument: levelId, from: this);

  @override
  String toString() => r'gameplayViewModelProvider';
}

/// ViewModel da Gameplay do Mundo 1 — família por `levelId` (não pelo objeto
/// `Level`, que não tem `==`/`hashCode` de valor). Orquestra a Execução
/// (`ProgramExecutor`) passo a passo, incluindo o timing da animação (mesmo
/// lugar de antes, dentro de `_run()`/`_goToResultScreen` do antigo
/// `GameplayScreen`) — a View só renderiza `state` e reage a
/// `state.pendingEffect` via `ref.listen`.

abstract class _$GameplayViewModel extends $Notifier<GameplayState> {
  late final _$args = ref.$arg as String;
  String get levelId => _$args;

  GameplayState build(String levelId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<GameplayState, GameplayState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GameplayState, GameplayState>,
              GameplayState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
