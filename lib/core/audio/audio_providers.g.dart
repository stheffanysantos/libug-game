// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(soundPlayer)
const soundPlayerProvider = SoundPlayerProvider._();

final class SoundPlayerProvider
    extends $FunctionalProvider<SoundPlayer, SoundPlayer, SoundPlayer>
    with $Provider<SoundPlayer> {
  const SoundPlayerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'soundPlayerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$soundPlayerHash();

  @$internal
  @override
  $ProviderElement<SoundPlayer> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SoundPlayer create(Ref ref) {
    return soundPlayer(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SoundPlayer value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SoundPlayer>(value),
    );
  }
}

String _$soundPlayerHash() => r'ee9a60c66ba310d440a80097fa4306cd33b7c17e';

/// Estado de sessão só (mute não persiste entre aberturas do app — mesma
/// decisão em aberto de persistência, ver `.claude/memory/decisions.md`).

@ProviderFor(Muted)
const mutedProvider = MutedProvider._();

/// Estado de sessão só (mute não persiste entre aberturas do app — mesma
/// decisão em aberto de persistência, ver `.claude/memory/decisions.md`).
final class MutedProvider extends $NotifierProvider<Muted, bool> {
  /// Estado de sessão só (mute não persiste entre aberturas do app — mesma
  /// decisão em aberto de persistência, ver `.claude/memory/decisions.md`).
  const MutedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mutedProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mutedHash();

  @$internal
  @override
  Muted create() => Muted();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$mutedHash() => r'a24e9c6fdce0dd49e57e2728407876ac0bf03e20';

/// Estado de sessão só (mute não persiste entre aberturas do app — mesma
/// decisão em aberto de persistência, ver `.claude/memory/decisions.md`).

abstract class _$Muted extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(appSounds)
const appSoundsProvider = AppSoundsProvider._();

final class AppSoundsProvider
    extends
        $FunctionalProvider<
          AppSoundsService,
          AppSoundsService,
          AppSoundsService
        >
    with $Provider<AppSoundsService> {
  const AppSoundsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appSoundsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appSoundsHash();

  @$internal
  @override
  $ProviderElement<AppSoundsService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppSoundsService create(Ref ref) {
    return appSounds(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppSoundsService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppSoundsService>(value),
    );
  }
}

String _$appSoundsHash() => r'4540702fa13c8e60bbd84dc0a23ecf1c6098ea61';
