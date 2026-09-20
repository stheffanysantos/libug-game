// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_level_win_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recordLevelWinUseCase)
const recordLevelWinUseCaseProvider = RecordLevelWinUseCaseProvider._();

final class RecordLevelWinUseCaseProvider
    extends
        $FunctionalProvider<
          RecordLevelWinUseCase,
          RecordLevelWinUseCase,
          RecordLevelWinUseCase
        >
    with $Provider<RecordLevelWinUseCase> {
  const RecordLevelWinUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recordLevelWinUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recordLevelWinUseCaseHash();

  @$internal
  @override
  $ProviderElement<RecordLevelWinUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RecordLevelWinUseCase create(Ref ref) {
    return recordLevelWinUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RecordLevelWinUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RecordLevelWinUseCase>(value),
    );
  }
}

String _$recordLevelWinUseCaseHash() =>
    r'e37977b5c62bb3e30d4ce64276fc7962b6586b17';
