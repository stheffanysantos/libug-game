// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Formulário de cadastro/login — estado real (modo, envio em andamento,
/// erro inline) vale um ViewModel de verdade (ver plano de migração, §4).

@ProviderFor(RegisterViewModel)
const registerViewModelProvider = RegisterViewModelProvider._();

/// Formulário de cadastro/login — estado real (modo, envio em andamento,
/// erro inline) vale um ViewModel de verdade (ver plano de migração, §4).
final class RegisterViewModelProvider
    extends $NotifierProvider<RegisterViewModel, RegisterState> {
  /// Formulário de cadastro/login — estado real (modo, envio em andamento,
  /// erro inline) vale um ViewModel de verdade (ver plano de migração, §4).
  const RegisterViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'registerViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$registerViewModelHash();

  @$internal
  @override
  RegisterViewModel create() => RegisterViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RegisterState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RegisterState>(value),
    );
  }
}

String _$registerViewModelHash() => r'e26040bf44516b59b16f67ac91f16ebb251ca4da';

/// Formulário de cadastro/login — estado real (modo, envio em andamento,
/// erro inline) vale um ViewModel de verdade (ver plano de migração, §4).

abstract class _$RegisterViewModel extends $Notifier<RegisterState> {
  RegisterState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<RegisterState, RegisterState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RegisterState, RegisterState>,
              RegisterState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
