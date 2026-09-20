// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_identity.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(deviceIdentity)
const deviceIdentityProvider = DeviceIdentityProvider._();

final class DeviceIdentityProvider
    extends $FunctionalProvider<DeviceIdentity, DeviceIdentity, DeviceIdentity>
    with $Provider<DeviceIdentity> {
  const DeviceIdentityProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deviceIdentityProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deviceIdentityHash();

  @$internal
  @override
  $ProviderElement<DeviceIdentity> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DeviceIdentity create(Ref ref) {
    return deviceIdentity(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeviceIdentity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeviceIdentity>(value),
    );
  }
}

String _$deviceIdentityHash() => r'c9ec578032e513ffcd49682fa0977efbd543c1fb';
