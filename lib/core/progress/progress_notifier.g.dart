// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Progresso do jogador — vive em memória durante a sessão, mas é
/// sincronizado com o Firestore por `ProgressRepository`. `build()` devolve
/// um `ProgressState` vazio **sincronamente** e dispara a hidratação como
/// `Future` fire-and-forget (`_hydrate`) — o jogo é 100% jogável antes/sem
/// hidratação (resiliência de estande: sem internet no evento é um caso
/// real). Ver `.claude/memory/decisions.md`.
///
/// `keepAlive: true` — é o progresso do jogador inteiro, não pode ser
/// descartado/reiniciado só porque nenhuma tela está observando no
/// momento (o padrão de `@riverpod` sem essa flag é `autoDispose`).

@ProviderFor(ProgressNotifier)
const progressProvider = ProgressNotifierProvider._();

/// Progresso do jogador — vive em memória durante a sessão, mas é
/// sincronizado com o Firestore por `ProgressRepository`. `build()` devolve
/// um `ProgressState` vazio **sincronamente** e dispara a hidratação como
/// `Future` fire-and-forget (`_hydrate`) — o jogo é 100% jogável antes/sem
/// hidratação (resiliência de estande: sem internet no evento é um caso
/// real). Ver `.claude/memory/decisions.md`.
///
/// `keepAlive: true` — é o progresso do jogador inteiro, não pode ser
/// descartado/reiniciado só porque nenhuma tela está observando no
/// momento (o padrão de `@riverpod` sem essa flag é `autoDispose`).
final class ProgressNotifierProvider
    extends $NotifierProvider<ProgressNotifier, ProgressState> {
  /// Progresso do jogador — vive em memória durante a sessão, mas é
  /// sincronizado com o Firestore por `ProgressRepository`. `build()` devolve
  /// um `ProgressState` vazio **sincronamente** e dispara a hidratação como
  /// `Future` fire-and-forget (`_hydrate`) — o jogo é 100% jogável antes/sem
  /// hidratação (resiliência de estande: sem internet no evento é um caso
  /// real). Ver `.claude/memory/decisions.md`.
  ///
  /// `keepAlive: true` — é o progresso do jogador inteiro, não pode ser
  /// descartado/reiniciado só porque nenhuma tela está observando no
  /// momento (o padrão de `@riverpod` sem essa flag é `autoDispose`).
  const ProgressNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'progressProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$progressNotifierHash();

  @$internal
  @override
  ProgressNotifier create() => ProgressNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProgressState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProgressState>(value),
    );
  }
}

String _$progressNotifierHash() => r'adfae2bc06f0304fe13171468184541089543575';

/// Progresso do jogador — vive em memória durante a sessão, mas é
/// sincronizado com o Firestore por `ProgressRepository`. `build()` devolve
/// um `ProgressState` vazio **sincronamente** e dispara a hidratação como
/// `Future` fire-and-forget (`_hydrate`) — o jogo é 100% jogável antes/sem
/// hidratação (resiliência de estande: sem internet no evento é um caso
/// real). Ver `.claude/memory/decisions.md`.
///
/// `keepAlive: true` — é o progresso do jogador inteiro, não pode ser
/// descartado/reiniciado só porque nenhuma tela está observando no
/// momento (o padrão de `@riverpod` sem essa flag é `autoDispose`).

abstract class _$ProgressNotifier extends $Notifier<ProgressState> {
  ProgressState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ProgressState, ProgressState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProgressState, ProgressState>,
              ProgressState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
