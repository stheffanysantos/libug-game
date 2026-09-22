// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'code_quest_gameplay_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CodeQuestGameplayState {
  CodeQuestLevel get level => throw _privateConstructorUsedError;
  int get currentQuestionIndex => throw _privateConstructorUsedError;
  int get totalAttempts => throw _privateConstructorUsedError;
  int? get selectedOptionIndex => throw _privateConstructorUsedError;
  bool get showWrongFeedback => throw _privateConstructorUsedError;
  CodeQuestGameplayEffect? get pendingEffect =>
      throw _privateConstructorUsedError;

  /// Create a copy of CodeQuestGameplayState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CodeQuestGameplayStateCopyWith<CodeQuestGameplayState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CodeQuestGameplayStateCopyWith<$Res> {
  factory $CodeQuestGameplayStateCopyWith(
    CodeQuestGameplayState value,
    $Res Function(CodeQuestGameplayState) then,
  ) = _$CodeQuestGameplayStateCopyWithImpl<$Res, CodeQuestGameplayState>;
  @useResult
  $Res call({
    CodeQuestLevel level,
    int currentQuestionIndex,
    int totalAttempts,
    int? selectedOptionIndex,
    bool showWrongFeedback,
    CodeQuestGameplayEffect? pendingEffect,
  });

  $CodeQuestGameplayEffectCopyWith<$Res>? get pendingEffect;
}

/// @nodoc
class _$CodeQuestGameplayStateCopyWithImpl<
  $Res,
  $Val extends CodeQuestGameplayState
>
    implements $CodeQuestGameplayStateCopyWith<$Res> {
  _$CodeQuestGameplayStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CodeQuestGameplayState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? currentQuestionIndex = null,
    Object? totalAttempts = null,
    Object? selectedOptionIndex = freezed,
    Object? showWrongFeedback = null,
    Object? pendingEffect = freezed,
  }) {
    return _then(
      _value.copyWith(
            level: null == level
                ? _value.level
                : level // ignore: cast_nullable_to_non_nullable
                      as CodeQuestLevel,
            currentQuestionIndex: null == currentQuestionIndex
                ? _value.currentQuestionIndex
                : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
                      as int,
            totalAttempts: null == totalAttempts
                ? _value.totalAttempts
                : totalAttempts // ignore: cast_nullable_to_non_nullable
                      as int,
            selectedOptionIndex: freezed == selectedOptionIndex
                ? _value.selectedOptionIndex
                : selectedOptionIndex // ignore: cast_nullable_to_non_nullable
                      as int?,
            showWrongFeedback: null == showWrongFeedback
                ? _value.showWrongFeedback
                : showWrongFeedback // ignore: cast_nullable_to_non_nullable
                      as bool,
            pendingEffect: freezed == pendingEffect
                ? _value.pendingEffect
                : pendingEffect // ignore: cast_nullable_to_non_nullable
                      as CodeQuestGameplayEffect?,
          )
          as $Val,
    );
  }

  /// Create a copy of CodeQuestGameplayState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CodeQuestGameplayEffectCopyWith<$Res>? get pendingEffect {
    if (_value.pendingEffect == null) {
      return null;
    }

    return $CodeQuestGameplayEffectCopyWith<$Res>(_value.pendingEffect!, (
      value,
    ) {
      return _then(_value.copyWith(pendingEffect: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CodeQuestGameplayStateImplCopyWith<$Res>
    implements $CodeQuestGameplayStateCopyWith<$Res> {
  factory _$$CodeQuestGameplayStateImplCopyWith(
    _$CodeQuestGameplayStateImpl value,
    $Res Function(_$CodeQuestGameplayStateImpl) then,
  ) = __$$CodeQuestGameplayStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    CodeQuestLevel level,
    int currentQuestionIndex,
    int totalAttempts,
    int? selectedOptionIndex,
    bool showWrongFeedback,
    CodeQuestGameplayEffect? pendingEffect,
  });

  @override
  $CodeQuestGameplayEffectCopyWith<$Res>? get pendingEffect;
}

/// @nodoc
class __$$CodeQuestGameplayStateImplCopyWithImpl<$Res>
    extends
        _$CodeQuestGameplayStateCopyWithImpl<$Res, _$CodeQuestGameplayStateImpl>
    implements _$$CodeQuestGameplayStateImplCopyWith<$Res> {
  __$$CodeQuestGameplayStateImplCopyWithImpl(
    _$CodeQuestGameplayStateImpl _value,
    $Res Function(_$CodeQuestGameplayStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CodeQuestGameplayState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? currentQuestionIndex = null,
    Object? totalAttempts = null,
    Object? selectedOptionIndex = freezed,
    Object? showWrongFeedback = null,
    Object? pendingEffect = freezed,
  }) {
    return _then(
      _$CodeQuestGameplayStateImpl(
        level: null == level
            ? _value.level
            : level // ignore: cast_nullable_to_non_nullable
                  as CodeQuestLevel,
        currentQuestionIndex: null == currentQuestionIndex
            ? _value.currentQuestionIndex
            : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        totalAttempts: null == totalAttempts
            ? _value.totalAttempts
            : totalAttempts // ignore: cast_nullable_to_non_nullable
                  as int,
        selectedOptionIndex: freezed == selectedOptionIndex
            ? _value.selectedOptionIndex
            : selectedOptionIndex // ignore: cast_nullable_to_non_nullable
                  as int?,
        showWrongFeedback: null == showWrongFeedback
            ? _value.showWrongFeedback
            : showWrongFeedback // ignore: cast_nullable_to_non_nullable
                  as bool,
        pendingEffect: freezed == pendingEffect
            ? _value.pendingEffect
            : pendingEffect // ignore: cast_nullable_to_non_nullable
                  as CodeQuestGameplayEffect?,
      ),
    );
  }
}

/// @nodoc

class _$CodeQuestGameplayStateImpl extends _CodeQuestGameplayState {
  const _$CodeQuestGameplayStateImpl({
    required this.level,
    this.currentQuestionIndex = 0,
    this.totalAttempts = 0,
    this.selectedOptionIndex,
    this.showWrongFeedback = false,
    this.pendingEffect,
  }) : super._();

  @override
  final CodeQuestLevel level;
  @override
  @JsonKey()
  final int currentQuestionIndex;
  @override
  @JsonKey()
  final int totalAttempts;
  @override
  final int? selectedOptionIndex;
  @override
  @JsonKey()
  final bool showWrongFeedback;
  @override
  final CodeQuestGameplayEffect? pendingEffect;

  @override
  String toString() {
    return 'CodeQuestGameplayState(level: $level, currentQuestionIndex: $currentQuestionIndex, totalAttempts: $totalAttempts, selectedOptionIndex: $selectedOptionIndex, showWrongFeedback: $showWrongFeedback, pendingEffect: $pendingEffect)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CodeQuestGameplayStateImpl &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.currentQuestionIndex, currentQuestionIndex) ||
                other.currentQuestionIndex == currentQuestionIndex) &&
            (identical(other.totalAttempts, totalAttempts) ||
                other.totalAttempts == totalAttempts) &&
            (identical(other.selectedOptionIndex, selectedOptionIndex) ||
                other.selectedOptionIndex == selectedOptionIndex) &&
            (identical(other.showWrongFeedback, showWrongFeedback) ||
                other.showWrongFeedback == showWrongFeedback) &&
            (identical(other.pendingEffect, pendingEffect) ||
                other.pendingEffect == pendingEffect));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    level,
    currentQuestionIndex,
    totalAttempts,
    selectedOptionIndex,
    showWrongFeedback,
    pendingEffect,
  );

  /// Create a copy of CodeQuestGameplayState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CodeQuestGameplayStateImplCopyWith<_$CodeQuestGameplayStateImpl>
  get copyWith =>
      __$$CodeQuestGameplayStateImplCopyWithImpl<_$CodeQuestGameplayStateImpl>(
        this,
        _$identity,
      );
}

abstract class _CodeQuestGameplayState extends CodeQuestGameplayState {
  const factory _CodeQuestGameplayState({
    required final CodeQuestLevel level,
    final int currentQuestionIndex,
    final int totalAttempts,
    final int? selectedOptionIndex,
    final bool showWrongFeedback,
    final CodeQuestGameplayEffect? pendingEffect,
  }) = _$CodeQuestGameplayStateImpl;
  const _CodeQuestGameplayState._() : super._();

  @override
  CodeQuestLevel get level;
  @override
  int get currentQuestionIndex;
  @override
  int get totalAttempts;
  @override
  int? get selectedOptionIndex;
  @override
  bool get showWrongFeedback;
  @override
  CodeQuestGameplayEffect? get pendingEffect;

  /// Create a copy of CodeQuestGameplayState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CodeQuestGameplayStateImplCopyWith<_$CodeQuestGameplayStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CodeQuestGameplayEffect {
  CodeQuestResultData get data => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CodeQuestResultData data) showResult,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CodeQuestResultData data)? showResult,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CodeQuestResultData data)? showResult,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShowCodeQuestResult value) showResult,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShowCodeQuestResult value)? showResult,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShowCodeQuestResult value)? showResult,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of CodeQuestGameplayEffect
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CodeQuestGameplayEffectCopyWith<CodeQuestGameplayEffect> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CodeQuestGameplayEffectCopyWith<$Res> {
  factory $CodeQuestGameplayEffectCopyWith(
    CodeQuestGameplayEffect value,
    $Res Function(CodeQuestGameplayEffect) then,
  ) = _$CodeQuestGameplayEffectCopyWithImpl<$Res, CodeQuestGameplayEffect>;
  @useResult
  $Res call({CodeQuestResultData data});
}

/// @nodoc
class _$CodeQuestGameplayEffectCopyWithImpl<
  $Res,
  $Val extends CodeQuestGameplayEffect
>
    implements $CodeQuestGameplayEffectCopyWith<$Res> {
  _$CodeQuestGameplayEffectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CodeQuestGameplayEffect
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = null}) {
    return _then(
      _value.copyWith(
            data: null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as CodeQuestResultData,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ShowCodeQuestResultImplCopyWith<$Res>
    implements $CodeQuestGameplayEffectCopyWith<$Res> {
  factory _$$ShowCodeQuestResultImplCopyWith(
    _$ShowCodeQuestResultImpl value,
    $Res Function(_$ShowCodeQuestResultImpl) then,
  ) = __$$ShowCodeQuestResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CodeQuestResultData data});
}

/// @nodoc
class __$$ShowCodeQuestResultImplCopyWithImpl<$Res>
    extends
        _$CodeQuestGameplayEffectCopyWithImpl<$Res, _$ShowCodeQuestResultImpl>
    implements _$$ShowCodeQuestResultImplCopyWith<$Res> {
  __$$ShowCodeQuestResultImplCopyWithImpl(
    _$ShowCodeQuestResultImpl _value,
    $Res Function(_$ShowCodeQuestResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CodeQuestGameplayEffect
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = null}) {
    return _then(
      _$ShowCodeQuestResultImpl(
        data: null == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as CodeQuestResultData,
      ),
    );
  }
}

/// @nodoc

class _$ShowCodeQuestResultImpl implements ShowCodeQuestResult {
  const _$ShowCodeQuestResultImpl({required this.data});

  @override
  final CodeQuestResultData data;

  @override
  String toString() {
    return 'CodeQuestGameplayEffect.showResult(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowCodeQuestResultImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of CodeQuestGameplayEffect
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowCodeQuestResultImplCopyWith<_$ShowCodeQuestResultImpl> get copyWith =>
      __$$ShowCodeQuestResultImplCopyWithImpl<_$ShowCodeQuestResultImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CodeQuestResultData data) showResult,
  }) {
    return showResult(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CodeQuestResultData data)? showResult,
  }) {
    return showResult?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CodeQuestResultData data)? showResult,
    required TResult orElse(),
  }) {
    if (showResult != null) {
      return showResult(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShowCodeQuestResult value) showResult,
  }) {
    return showResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShowCodeQuestResult value)? showResult,
  }) {
    return showResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShowCodeQuestResult value)? showResult,
    required TResult orElse(),
  }) {
    if (showResult != null) {
      return showResult(this);
    }
    return orElse();
  }
}

abstract class ShowCodeQuestResult implements CodeQuestGameplayEffect {
  const factory ShowCodeQuestResult({required final CodeQuestResultData data}) =
      _$ShowCodeQuestResultImpl;

  @override
  CodeQuestResultData get data;

  /// Create a copy of CodeQuestGameplayEffect
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShowCodeQuestResultImplCopyWith<_$ShowCodeQuestResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
