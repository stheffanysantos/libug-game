// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_sync_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(leaderboardSyncService)
const leaderboardSyncServiceProvider = LeaderboardSyncServiceProvider._();

final class LeaderboardSyncServiceProvider
    extends
        $FunctionalProvider<
          LeaderboardSyncService,
          LeaderboardSyncService,
          LeaderboardSyncService
        >
    with $Provider<LeaderboardSyncService> {
  const LeaderboardSyncServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'leaderboardSyncServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$leaderboardSyncServiceHash();

  @$internal
  @override
  $ProviderElement<LeaderboardSyncService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LeaderboardSyncService create(Ref ref) {
    return leaderboardSyncService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LeaderboardSyncService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LeaderboardSyncService>(value),
    );
  }
}

String _$leaderboardSyncServiceHash() =>
    r'abcd0a74eb6a44eed8aa76796e9d15f8cbd4bad8';
