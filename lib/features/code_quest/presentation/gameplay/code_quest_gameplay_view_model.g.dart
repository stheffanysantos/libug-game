// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_quest_gameplay_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$codeQuestGameplayViewModelHash() =>
    r'bc47175504f656286ef71d6ec9e3aad6c5f15829';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$CodeQuestGameplayViewModel
    extends BuildlessAutoDisposeNotifier<CodeQuestGameplayState> {
  late final String levelId;

  CodeQuestGameplayState build(String levelId);
}

/// ViewModel da Gameplay do Mundo 4 ("Missão de Código") — sem passo a
/// passo/grid (diferente de `GameplayViewModel`): cada `confirm()` avança
/// ou não o cursor de pergunta conforme `checkCodeQuestAnswer`
/// (`lib/game/code_quest_progress.dart`). Família por `levelId`.
///
/// Copied from [CodeQuestGameplayViewModel].
@ProviderFor(CodeQuestGameplayViewModel)
const codeQuestGameplayViewModelProvider = CodeQuestGameplayViewModelFamily();

/// ViewModel da Gameplay do Mundo 4 ("Missão de Código") — sem passo a
/// passo/grid (diferente de `GameplayViewModel`): cada `confirm()` avança
/// ou não o cursor de pergunta conforme `checkCodeQuestAnswer`
/// (`lib/game/code_quest_progress.dart`). Família por `levelId`.
///
/// Copied from [CodeQuestGameplayViewModel].
class CodeQuestGameplayViewModelFamily extends Family<CodeQuestGameplayState> {
  /// ViewModel da Gameplay do Mundo 4 ("Missão de Código") — sem passo a
  /// passo/grid (diferente de `GameplayViewModel`): cada `confirm()` avança
  /// ou não o cursor de pergunta conforme `checkCodeQuestAnswer`
  /// (`lib/game/code_quest_progress.dart`). Família por `levelId`.
  ///
  /// Copied from [CodeQuestGameplayViewModel].
  const CodeQuestGameplayViewModelFamily();

  /// ViewModel da Gameplay do Mundo 4 ("Missão de Código") — sem passo a
  /// passo/grid (diferente de `GameplayViewModel`): cada `confirm()` avança
  /// ou não o cursor de pergunta conforme `checkCodeQuestAnswer`
  /// (`lib/game/code_quest_progress.dart`). Família por `levelId`.
  ///
  /// Copied from [CodeQuestGameplayViewModel].
  CodeQuestGameplayViewModelProvider call(String levelId) {
    return CodeQuestGameplayViewModelProvider(levelId);
  }

  @override
  CodeQuestGameplayViewModelProvider getProviderOverride(
    covariant CodeQuestGameplayViewModelProvider provider,
  ) {
    return call(provider.levelId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'codeQuestGameplayViewModelProvider';
}

/// ViewModel da Gameplay do Mundo 4 ("Missão de Código") — sem passo a
/// passo/grid (diferente de `GameplayViewModel`): cada `confirm()` avança
/// ou não o cursor de pergunta conforme `checkCodeQuestAnswer`
/// (`lib/game/code_quest_progress.dart`). Família por `levelId`.
///
/// Copied from [CodeQuestGameplayViewModel].
class CodeQuestGameplayViewModelProvider
    extends
        AutoDisposeNotifierProviderImpl<
          CodeQuestGameplayViewModel,
          CodeQuestGameplayState
        > {
  /// ViewModel da Gameplay do Mundo 4 ("Missão de Código") — sem passo a
  /// passo/grid (diferente de `GameplayViewModel`): cada `confirm()` avança
  /// ou não o cursor de pergunta conforme `checkCodeQuestAnswer`
  /// (`lib/game/code_quest_progress.dart`). Família por `levelId`.
  ///
  /// Copied from [CodeQuestGameplayViewModel].
  CodeQuestGameplayViewModelProvider(String levelId)
    : this._internal(
        () => CodeQuestGameplayViewModel()..levelId = levelId,
        from: codeQuestGameplayViewModelProvider,
        name: r'codeQuestGameplayViewModelProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$codeQuestGameplayViewModelHash,
        dependencies: CodeQuestGameplayViewModelFamily._dependencies,
        allTransitiveDependencies:
            CodeQuestGameplayViewModelFamily._allTransitiveDependencies,
        levelId: levelId,
      );

  CodeQuestGameplayViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.levelId,
  }) : super.internal();

  final String levelId;

  @override
  CodeQuestGameplayState runNotifierBuild(
    covariant CodeQuestGameplayViewModel notifier,
  ) {
    return notifier.build(levelId);
  }

  @override
  Override overrideWith(CodeQuestGameplayViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: CodeQuestGameplayViewModelProvider._internal(
        () => create()..levelId = levelId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        levelId: levelId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<
    CodeQuestGameplayViewModel,
    CodeQuestGameplayState
  >
  createElement() {
    return _CodeQuestGameplayViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CodeQuestGameplayViewModelProvider &&
        other.levelId == levelId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, levelId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CodeQuestGameplayViewModelRef
    on AutoDisposeNotifierProviderRef<CodeQuestGameplayState> {
  /// The parameter `levelId` of this provider.
  String get levelId;
}

class _CodeQuestGameplayViewModelProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          CodeQuestGameplayViewModel,
          CodeQuestGameplayState
        >
    with CodeQuestGameplayViewModelRef {
  _CodeQuestGameplayViewModelProviderElement(super.provider);

  @override
  String get levelId => (origin as CodeQuestGameplayViewModelProvider).levelId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
