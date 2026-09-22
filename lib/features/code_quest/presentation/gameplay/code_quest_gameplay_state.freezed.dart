// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'code_quest_gameplay_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CodeQuestGameplayState {

 CodeQuestLevel get level; int get currentQuestionIndex; int get totalAttempts; int? get selectedOptionIndex; bool get showWrongFeedback; CodeQuestGameplayEffect? get pendingEffect;
/// Create a copy of CodeQuestGameplayState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CodeQuestGameplayStateCopyWith<CodeQuestGameplayState> get copyWith => _$CodeQuestGameplayStateCopyWithImpl<CodeQuestGameplayState>(this as CodeQuestGameplayState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CodeQuestGameplayState&&(identical(other.level, level) || other.level == level)&&(identical(other.currentQuestionIndex, currentQuestionIndex) || other.currentQuestionIndex == currentQuestionIndex)&&(identical(other.totalAttempts, totalAttempts) || other.totalAttempts == totalAttempts)&&(identical(other.selectedOptionIndex, selectedOptionIndex) || other.selectedOptionIndex == selectedOptionIndex)&&(identical(other.showWrongFeedback, showWrongFeedback) || other.showWrongFeedback == showWrongFeedback)&&(identical(other.pendingEffect, pendingEffect) || other.pendingEffect == pendingEffect));
}


@override
int get hashCode => Object.hash(runtimeType,level,currentQuestionIndex,totalAttempts,selectedOptionIndex,showWrongFeedback,pendingEffect);

@override
String toString() {
  return 'CodeQuestGameplayState(level: $level, currentQuestionIndex: $currentQuestionIndex, totalAttempts: $totalAttempts, selectedOptionIndex: $selectedOptionIndex, showWrongFeedback: $showWrongFeedback, pendingEffect: $pendingEffect)';
}


}

/// @nodoc
abstract mixin class $CodeQuestGameplayStateCopyWith<$Res>  {
  factory $CodeQuestGameplayStateCopyWith(CodeQuestGameplayState value, $Res Function(CodeQuestGameplayState) _then) = _$CodeQuestGameplayStateCopyWithImpl;
@useResult
$Res call({
 CodeQuestLevel level, int currentQuestionIndex, int totalAttempts, int? selectedOptionIndex, bool showWrongFeedback, CodeQuestGameplayEffect? pendingEffect
});


$CodeQuestGameplayEffectCopyWith<$Res>? get pendingEffect;

}
/// @nodoc
class _$CodeQuestGameplayStateCopyWithImpl<$Res>
    implements $CodeQuestGameplayStateCopyWith<$Res> {
  _$CodeQuestGameplayStateCopyWithImpl(this._self, this._then);

  final CodeQuestGameplayState _self;
  final $Res Function(CodeQuestGameplayState) _then;

/// Create a copy of CodeQuestGameplayState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? level = null,Object? currentQuestionIndex = null,Object? totalAttempts = null,Object? selectedOptionIndex = freezed,Object? showWrongFeedback = null,Object? pendingEffect = freezed,}) {
  return _then(_self.copyWith(
level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as CodeQuestLevel,currentQuestionIndex: null == currentQuestionIndex ? _self.currentQuestionIndex : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
as int,totalAttempts: null == totalAttempts ? _self.totalAttempts : totalAttempts // ignore: cast_nullable_to_non_nullable
as int,selectedOptionIndex: freezed == selectedOptionIndex ? _self.selectedOptionIndex : selectedOptionIndex // ignore: cast_nullable_to_non_nullable
as int?,showWrongFeedback: null == showWrongFeedback ? _self.showWrongFeedback : showWrongFeedback // ignore: cast_nullable_to_non_nullable
as bool,pendingEffect: freezed == pendingEffect ? _self.pendingEffect : pendingEffect // ignore: cast_nullable_to_non_nullable
as CodeQuestGameplayEffect?,
  ));
}
/// Create a copy of CodeQuestGameplayState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CodeQuestGameplayEffectCopyWith<$Res>? get pendingEffect {
    if (_self.pendingEffect == null) {
    return null;
  }

  return $CodeQuestGameplayEffectCopyWith<$Res>(_self.pendingEffect!, (value) {
    return _then(_self.copyWith(pendingEffect: value));
  });
}
}


/// Adds pattern-matching-related methods to [CodeQuestGameplayState].
extension CodeQuestGameplayStatePatterns on CodeQuestGameplayState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CodeQuestGameplayState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CodeQuestGameplayState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CodeQuestGameplayState value)  $default,){
final _that = this;
switch (_that) {
case _CodeQuestGameplayState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CodeQuestGameplayState value)?  $default,){
final _that = this;
switch (_that) {
case _CodeQuestGameplayState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CodeQuestLevel level,  int currentQuestionIndex,  int totalAttempts,  int? selectedOptionIndex,  bool showWrongFeedback,  CodeQuestGameplayEffect? pendingEffect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CodeQuestGameplayState() when $default != null:
return $default(_that.level,_that.currentQuestionIndex,_that.totalAttempts,_that.selectedOptionIndex,_that.showWrongFeedback,_that.pendingEffect);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CodeQuestLevel level,  int currentQuestionIndex,  int totalAttempts,  int? selectedOptionIndex,  bool showWrongFeedback,  CodeQuestGameplayEffect? pendingEffect)  $default,) {final _that = this;
switch (_that) {
case _CodeQuestGameplayState():
return $default(_that.level,_that.currentQuestionIndex,_that.totalAttempts,_that.selectedOptionIndex,_that.showWrongFeedback,_that.pendingEffect);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CodeQuestLevel level,  int currentQuestionIndex,  int totalAttempts,  int? selectedOptionIndex,  bool showWrongFeedback,  CodeQuestGameplayEffect? pendingEffect)?  $default,) {final _that = this;
switch (_that) {
case _CodeQuestGameplayState() when $default != null:
return $default(_that.level,_that.currentQuestionIndex,_that.totalAttempts,_that.selectedOptionIndex,_that.showWrongFeedback,_that.pendingEffect);case _:
  return null;

}
}

}

/// @nodoc


class _CodeQuestGameplayState extends CodeQuestGameplayState {
  const _CodeQuestGameplayState({required this.level, this.currentQuestionIndex = 0, this.totalAttempts = 0, this.selectedOptionIndex, this.showWrongFeedback = false, this.pendingEffect}): super._();
  

@override final  CodeQuestLevel level;
@override@JsonKey() final  int currentQuestionIndex;
@override@JsonKey() final  int totalAttempts;
@override final  int? selectedOptionIndex;
@override@JsonKey() final  bool showWrongFeedback;
@override final  CodeQuestGameplayEffect? pendingEffect;

/// Create a copy of CodeQuestGameplayState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CodeQuestGameplayStateCopyWith<_CodeQuestGameplayState> get copyWith => __$CodeQuestGameplayStateCopyWithImpl<_CodeQuestGameplayState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CodeQuestGameplayState&&(identical(other.level, level) || other.level == level)&&(identical(other.currentQuestionIndex, currentQuestionIndex) || other.currentQuestionIndex == currentQuestionIndex)&&(identical(other.totalAttempts, totalAttempts) || other.totalAttempts == totalAttempts)&&(identical(other.selectedOptionIndex, selectedOptionIndex) || other.selectedOptionIndex == selectedOptionIndex)&&(identical(other.showWrongFeedback, showWrongFeedback) || other.showWrongFeedback == showWrongFeedback)&&(identical(other.pendingEffect, pendingEffect) || other.pendingEffect == pendingEffect));
}


@override
int get hashCode => Object.hash(runtimeType,level,currentQuestionIndex,totalAttempts,selectedOptionIndex,showWrongFeedback,pendingEffect);

@override
String toString() {
  return 'CodeQuestGameplayState(level: $level, currentQuestionIndex: $currentQuestionIndex, totalAttempts: $totalAttempts, selectedOptionIndex: $selectedOptionIndex, showWrongFeedback: $showWrongFeedback, pendingEffect: $pendingEffect)';
}


}

/// @nodoc
abstract mixin class _$CodeQuestGameplayStateCopyWith<$Res> implements $CodeQuestGameplayStateCopyWith<$Res> {
  factory _$CodeQuestGameplayStateCopyWith(_CodeQuestGameplayState value, $Res Function(_CodeQuestGameplayState) _then) = __$CodeQuestGameplayStateCopyWithImpl;
@override @useResult
$Res call({
 CodeQuestLevel level, int currentQuestionIndex, int totalAttempts, int? selectedOptionIndex, bool showWrongFeedback, CodeQuestGameplayEffect? pendingEffect
});


@override $CodeQuestGameplayEffectCopyWith<$Res>? get pendingEffect;

}
/// @nodoc
class __$CodeQuestGameplayStateCopyWithImpl<$Res>
    implements _$CodeQuestGameplayStateCopyWith<$Res> {
  __$CodeQuestGameplayStateCopyWithImpl(this._self, this._then);

  final _CodeQuestGameplayState _self;
  final $Res Function(_CodeQuestGameplayState) _then;

/// Create a copy of CodeQuestGameplayState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? level = null,Object? currentQuestionIndex = null,Object? totalAttempts = null,Object? selectedOptionIndex = freezed,Object? showWrongFeedback = null,Object? pendingEffect = freezed,}) {
  return _then(_CodeQuestGameplayState(
level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as CodeQuestLevel,currentQuestionIndex: null == currentQuestionIndex ? _self.currentQuestionIndex : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
as int,totalAttempts: null == totalAttempts ? _self.totalAttempts : totalAttempts // ignore: cast_nullable_to_non_nullable
as int,selectedOptionIndex: freezed == selectedOptionIndex ? _self.selectedOptionIndex : selectedOptionIndex // ignore: cast_nullable_to_non_nullable
as int?,showWrongFeedback: null == showWrongFeedback ? _self.showWrongFeedback : showWrongFeedback // ignore: cast_nullable_to_non_nullable
as bool,pendingEffect: freezed == pendingEffect ? _self.pendingEffect : pendingEffect // ignore: cast_nullable_to_non_nullable
as CodeQuestGameplayEffect?,
  ));
}

/// Create a copy of CodeQuestGameplayState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CodeQuestGameplayEffectCopyWith<$Res>? get pendingEffect {
    if (_self.pendingEffect == null) {
    return null;
  }

  return $CodeQuestGameplayEffectCopyWith<$Res>(_self.pendingEffect!, (value) {
    return _then(_self.copyWith(pendingEffect: value));
  });
}
}

/// @nodoc
mixin _$CodeQuestGameplayEffect {

 CodeQuestResultData get data;
/// Create a copy of CodeQuestGameplayEffect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CodeQuestGameplayEffectCopyWith<CodeQuestGameplayEffect> get copyWith => _$CodeQuestGameplayEffectCopyWithImpl<CodeQuestGameplayEffect>(this as CodeQuestGameplayEffect, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CodeQuestGameplayEffect&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'CodeQuestGameplayEffect(data: $data)';
}


}

/// @nodoc
abstract mixin class $CodeQuestGameplayEffectCopyWith<$Res>  {
  factory $CodeQuestGameplayEffectCopyWith(CodeQuestGameplayEffect value, $Res Function(CodeQuestGameplayEffect) _then) = _$CodeQuestGameplayEffectCopyWithImpl;
@useResult
$Res call({
 CodeQuestResultData data
});




}
/// @nodoc
class _$CodeQuestGameplayEffectCopyWithImpl<$Res>
    implements $CodeQuestGameplayEffectCopyWith<$Res> {
  _$CodeQuestGameplayEffectCopyWithImpl(this._self, this._then);

  final CodeQuestGameplayEffect _self;
  final $Res Function(CodeQuestGameplayEffect) _then;

/// Create a copy of CodeQuestGameplayEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CodeQuestResultData,
  ));
}

}


/// Adds pattern-matching-related methods to [CodeQuestGameplayEffect].
extension CodeQuestGameplayEffectPatterns on CodeQuestGameplayEffect {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ShowCodeQuestResult value)?  showResult,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ShowCodeQuestResult() when showResult != null:
return showResult(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ShowCodeQuestResult value)  showResult,}){
final _that = this;
switch (_that) {
case ShowCodeQuestResult():
return showResult(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ShowCodeQuestResult value)?  showResult,}){
final _that = this;
switch (_that) {
case ShowCodeQuestResult() when showResult != null:
return showResult(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( CodeQuestResultData data)?  showResult,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ShowCodeQuestResult() when showResult != null:
return showResult(_that.data);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( CodeQuestResultData data)  showResult,}) {final _that = this;
switch (_that) {
case ShowCodeQuestResult():
return showResult(_that.data);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( CodeQuestResultData data)?  showResult,}) {final _that = this;
switch (_that) {
case ShowCodeQuestResult() when showResult != null:
return showResult(_that.data);case _:
  return null;

}
}

}

/// @nodoc


class ShowCodeQuestResult implements CodeQuestGameplayEffect {
  const ShowCodeQuestResult({required this.data});
  

@override final  CodeQuestResultData data;

/// Create a copy of CodeQuestGameplayEffect
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShowCodeQuestResultCopyWith<ShowCodeQuestResult> get copyWith => _$ShowCodeQuestResultCopyWithImpl<ShowCodeQuestResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShowCodeQuestResult&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'CodeQuestGameplayEffect.showResult(data: $data)';
}


}

/// @nodoc
abstract mixin class $ShowCodeQuestResultCopyWith<$Res> implements $CodeQuestGameplayEffectCopyWith<$Res> {
  factory $ShowCodeQuestResultCopyWith(ShowCodeQuestResult value, $Res Function(ShowCodeQuestResult) _then) = _$ShowCodeQuestResultCopyWithImpl;
@override @useResult
$Res call({
 CodeQuestResultData data
});




}
/// @nodoc
class _$ShowCodeQuestResultCopyWithImpl<$Res>
    implements $ShowCodeQuestResultCopyWith<$Res> {
  _$ShowCodeQuestResultCopyWithImpl(this._self, this._then);

  final ShowCodeQuestResult _self;
  final $Res Function(ShowCodeQuestResult) _then;

/// Create a copy of CodeQuestGameplayEffect
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(ShowCodeQuestResult(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CodeQuestResultData,
  ));
}


}

// dart format on
