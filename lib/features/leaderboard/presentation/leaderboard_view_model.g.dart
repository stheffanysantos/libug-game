// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Carrega o Placar Geral — estado async real (ver plano de migração, §4:
/// "leaderboard ganha ViewModel de verdade"). Sem `LeaderboardState`
/// próprio: `AsyncValue<LeaderboardData>` já modela loading/data/erro
/// sozinho, embrulhar isso numa classe `@freezed` só duplicaria o que o
/// riverpod_generator já gera de graça para um `build()` que devolve
/// `Future<T>`. `autoDispose` (padrão) é o comportamento certo — o ranking é
/// só desta tela, não precisa sobreviver depois que ela fecha.

@ProviderFor(LeaderboardViewModel)
const leaderboardViewModelProvider = LeaderboardViewModelProvider._();

/// Carrega o Placar Geral — estado async real (ver plano de migração, §4:
/// "leaderboard ganha ViewModel de verdade"). Sem `LeaderboardState`
/// próprio: `AsyncValue<LeaderboardData>` já modela loading/data/erro
/// sozinho, embrulhar isso numa classe `@freezed` só duplicaria o que o
/// riverpod_generator já gera de graça para um `build()` que devolve
/// `Future<T>`. `autoDispose` (padrão) é o comportamento certo — o ranking é
/// só desta tela, não precisa sobreviver depois que ela fecha.
final class LeaderboardViewModelProvider
    extends $AsyncNotifierProvider<LeaderboardViewModel, LeaderboardData> {
  /// Carrega o Placar Geral — estado async real (ver plano de migração, §4:
  /// "leaderboard ganha ViewModel de verdade"). Sem `LeaderboardState`
  /// próprio: `AsyncValue<LeaderboardData>` já modela loading/data/erro
  /// sozinho, embrulhar isso numa classe `@freezed` só duplicaria o que o
  /// riverpod_generator já gera de graça para um `build()` que devolve
  /// `Future<T>`. `autoDispose` (padrão) é o comportamento certo — o ranking é
  /// só desta tela, não precisa sobreviver depois que ela fecha.
  const LeaderboardViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'leaderboardViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$leaderboardViewModelHash();

  @$internal
  @override
  LeaderboardViewModel create() => LeaderboardViewModel();
}

String _$leaderboardViewModelHash() =>
    r'4547aaa5d0d65d03ba965c2009a5975f9ef58641';

/// Carrega o Placar Geral — estado async real (ver plano de migração, §4:
/// "leaderboard ganha ViewModel de verdade"). Sem `LeaderboardState`
/// próprio: `AsyncValue<LeaderboardData>` já modela loading/data/erro
/// sozinho, embrulhar isso numa classe `@freezed` só duplicaria o que o
/// riverpod_generator já gera de graça para um `build()` que devolve
/// `Future<T>`. `autoDispose` (padrão) é o comportamento certo — o ranking é
/// só desta tela, não precisa sobreviver depois que ela fecha.

abstract class _$LeaderboardViewModel extends $AsyncNotifier<LeaderboardData> {
  FutureOr<LeaderboardData> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<LeaderboardData>, LeaderboardData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<LeaderboardData>, LeaderboardData>,
              AsyncValue<LeaderboardData>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
