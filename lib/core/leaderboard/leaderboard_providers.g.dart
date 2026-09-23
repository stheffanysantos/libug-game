// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Firebase configurado e inicializado com sucesso (ver `main.dart`) →
/// Firestore, compartilhado entre aparelhos. Caso contrário (sem projeto
/// configurado para esta plataforma, sem internet no boot) → cai para o
/// armazenamento local do aparelho, sem quebrar o Placar.

@ProviderFor(leaderboardRepository)
const leaderboardRepositoryProvider = LeaderboardRepositoryProvider._();

/// Firebase configurado e inicializado com sucesso (ver `main.dart`) →
/// Firestore, compartilhado entre aparelhos. Caso contrário (sem projeto
/// configurado para esta plataforma, sem internet no boot) → cai para o
/// armazenamento local do aparelho, sem quebrar o Placar.

final class LeaderboardRepositoryProvider
    extends
        $FunctionalProvider<
          LeaderboardRepository,
          LeaderboardRepository,
          LeaderboardRepository
        >
    with $Provider<LeaderboardRepository> {
  /// Firebase configurado e inicializado com sucesso (ver `main.dart`) →
  /// Firestore, compartilhado entre aparelhos. Caso contrário (sem projeto
  /// configurado para esta plataforma, sem internet no boot) → cai para o
  /// armazenamento local do aparelho, sem quebrar o Placar.
  const LeaderboardRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'leaderboardRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$leaderboardRepositoryHash();

  @$internal
  @override
  $ProviderElement<LeaderboardRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LeaderboardRepository create(Ref ref) {
    return leaderboardRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LeaderboardRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LeaderboardRepository>(value),
    );
  }
}

String _$leaderboardRepositoryHash() =>
    r'1d0e60ac5306882f400511dceceb996ccf5c5364';
