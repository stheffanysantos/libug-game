// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// `SplashView` consulta `seenWelcome` antes de navegar ao tocar "JOGAR"; se
/// `false`, empurra `WelcomeView` (3 slides + escolha de conta) em vez de ir
/// direto pra Seleção de Mundo. `WorldSelectView` consulta `hasSeen(world.number)`
/// antes de navegar; se `false`, empurra a `TutorialView` do mundo em vez de
/// navegar direto, e `markSeen` é chamado quando o jogador termina o
/// tutorial. `keepAlive: true` — pelo mesmo motivo de `ProgressNotifier`.
///
/// Persistido via `OnboardingRepository` (device-local, `shared_preferences`)
/// — antes ficava só em memória e resetava a cada reload da página/restart
/// do app, mostrando a apresentação da Libug/Lili de novo a cada visita
/// (achado real do usuário). `build()` devolve o estado vazio
/// **sincronamente** e hidrata como `Future` fire-and-forget, mesmo padrão
/// de `ProgressNotifier` — o jogo não espera a leitura do storage pra
/// renderizar a Splash.

@ProviderFor(OnboardingNotifier)
const onboardingProvider = OnboardingNotifierProvider._();

/// `SplashView` consulta `seenWelcome` antes de navegar ao tocar "JOGAR"; se
/// `false`, empurra `WelcomeView` (3 slides + escolha de conta) em vez de ir
/// direto pra Seleção de Mundo. `WorldSelectView` consulta `hasSeen(world.number)`
/// antes de navegar; se `false`, empurra a `TutorialView` do mundo em vez de
/// navegar direto, e `markSeen` é chamado quando o jogador termina o
/// tutorial. `keepAlive: true` — pelo mesmo motivo de `ProgressNotifier`.
///
/// Persistido via `OnboardingRepository` (device-local, `shared_preferences`)
/// — antes ficava só em memória e resetava a cada reload da página/restart
/// do app, mostrando a apresentação da Libug/Lili de novo a cada visita
/// (achado real do usuário). `build()` devolve o estado vazio
/// **sincronamente** e hidrata como `Future` fire-and-forget, mesmo padrão
/// de `ProgressNotifier` — o jogo não espera a leitura do storage pra
/// renderizar a Splash.
final class OnboardingNotifierProvider
    extends $NotifierProvider<OnboardingNotifier, OnboardingState> {
  /// `SplashView` consulta `seenWelcome` antes de navegar ao tocar "JOGAR"; se
  /// `false`, empurra `WelcomeView` (3 slides + escolha de conta) em vez de ir
  /// direto pra Seleção de Mundo. `WorldSelectView` consulta `hasSeen(world.number)`
  /// antes de navegar; se `false`, empurra a `TutorialView` do mundo em vez de
  /// navegar direto, e `markSeen` é chamado quando o jogador termina o
  /// tutorial. `keepAlive: true` — pelo mesmo motivo de `ProgressNotifier`.
  ///
  /// Persistido via `OnboardingRepository` (device-local, `shared_preferences`)
  /// — antes ficava só em memória e resetava a cada reload da página/restart
  /// do app, mostrando a apresentação da Libug/Lili de novo a cada visita
  /// (achado real do usuário). `build()` devolve o estado vazio
  /// **sincronamente** e hidrata como `Future` fire-and-forget, mesmo padrão
  /// de `ProgressNotifier` — o jogo não espera a leitura do storage pra
  /// renderizar a Splash.
  const OnboardingNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onboardingNotifierHash();

  @$internal
  @override
  OnboardingNotifier create() => OnboardingNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OnboardingState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OnboardingState>(value),
    );
  }
}

String _$onboardingNotifierHash() =>
    r'f20015fa3f216adb5c7ce4cd98cd02a9f352ebee';

/// `SplashView` consulta `seenWelcome` antes de navegar ao tocar "JOGAR"; se
/// `false`, empurra `WelcomeView` (3 slides + escolha de conta) em vez de ir
/// direto pra Seleção de Mundo. `WorldSelectView` consulta `hasSeen(world.number)`
/// antes de navegar; se `false`, empurra a `TutorialView` do mundo em vez de
/// navegar direto, e `markSeen` é chamado quando o jogador termina o
/// tutorial. `keepAlive: true` — pelo mesmo motivo de `ProgressNotifier`.
///
/// Persistido via `OnboardingRepository` (device-local, `shared_preferences`)
/// — antes ficava só em memória e resetava a cada reload da página/restart
/// do app, mostrando a apresentação da Libug/Lili de novo a cada visita
/// (achado real do usuário). `build()` devolve o estado vazio
/// **sincronamente** e hidrata como `Future` fire-and-forget, mesmo padrão
/// de `ProgressNotifier` — o jogo não espera a leitura do storage pra
/// renderizar a Splash.

abstract class _$OnboardingNotifier extends $Notifier<OnboardingState> {
  OnboardingState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<OnboardingState, OnboardingState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<OnboardingState, OnboardingState>,
              OnboardingState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
