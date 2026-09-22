// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'complete_code_gameplay_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CompleteCodeGameplayState {

 CompleteCodeLevel get level; int? get selectedOptionIndex; int get attempts; CompleteCodeGameplayEffect? get pendingEffect;
/// Create a copy of CompleteCodeGameplayState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompleteCodeGameplayStateCopyWith<CompleteCodeGameplayState> get copyWith => _$CompleteCodeGameplayStateCopyWithImpl<CompleteCodeGameplayState>(this as CompleteCodeGameplayState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompleteCodeGameplayState&&(identical(other.level, level) || other.level == level)&&(identical(other.selectedOptionIndex, selectedOptionIndex) || other.selectedOptionIndex == selectedOptionIndex)&&(identical(other.attempts, attempts) || other.attempts == attempts)&&(identical(other.pendingEffect, pendingEffect) || other.pendingEffect == pendingEffect));
}


@override
int get hashCode => Object.hash(runtimeType,level,selectedOptionIndex,attempts,pendingEffect);

@override
String toString() {
  return 'CompleteCodeGameplayState(level: $level, selectedOptionIndex: $selectedOptionIndex, attempts: $attempts, pendingEffect: $pendingEffect)';
}


}

/// @nodoc
abstract mixin class $CompleteCodeGameplayStateCopyWith<$Res>  {
  factory $CompleteCodeGameplayStateCopyWith(CompleteCodeGameplayState value, $Res Function(CompleteCodeGameplayState) _then) = _$CompleteCodeGameplayStateCopyWithImpl;
@useResult
$Res call({
 CompleteCodeLevel level, int? selectedOptionIndex, int attempts, CompleteCodeGameplayEffect? pendingEffect
});


$CompleteCodeGameplayEffectCopyWith<$Res>? get pendingEffect;

}
/// @nodoc
class _$CompleteCodeGameplayStateCopyWithImpl<$Res>
    implements $CompleteCodeGameplayStateCopyWith<$Res> {
  _$CompleteCodeGameplayStateCopyWithImpl(this._self, this._then);

  final CompleteCodeGameplayState _self;
  final $Res Function(CompleteCodeGameplayState) _then;

/// Create a copy of CompleteCodeGameplayState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? level = null,Object? selectedOptionIndex = freezed,Object? attempts = null,Object? pendingEffect = freezed,}) {
  return _then(_self.copyWith(
level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as CompleteCodeLevel,selectedOptionIndex: freezed == selectedOptionIndex ? _self.selectedOptionIndex : selectedOptionIndex // ignore: cast_nullable_to_non_nullable
as int?,attempts: null == attempts ? _self.attempts : attempts // ignore: cast_nullable_to_non_nullable
as int,pendingEffect: freezed == pendingEffect ? _self.pendingEffect : pendingEffect // ignore: cast_nullable_to_non_nullable
as CompleteCodeGameplayEffect?,
  ));
}
/// Create a copy of CompleteCodeGameplayState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompleteCodeGameplayEffectCopyWith<$Res>? get pendingEffect {
    if (_self.pendingEffect == null) {
    return null;
  }

  return $CompleteCodeGameplayEffectCopyWith<$Res>(_self.pendingEffect!, (value) {
    return _then(_self.copyWith(pendingEffect: value));
  });
}
}


/// Adds pattern-matching-related methods to [CompleteCodeGameplayState].
extension CompleteCodeGameplayStatePatterns on CompleteCodeGameplayState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompleteCodeGameplayState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompleteCodeGameplayState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompleteCodeGameplayState value)  $default,){
final _that = this;
switch (_that) {
case _CompleteCodeGameplayState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompleteCodeGameplayState value)?  $default,){
final _that = this;
switch (_that) {
case _CompleteCodeGameplayState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CompleteCodeLevel level,  int? selectedOptionIndex,  int attempts,  CompleteCodeGameplayEffect? pendingEffect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompleteCodeGameplayState() when $default != null:
return $default(_that.level,_that.selectedOptionIndex,_that.attempts,_that.pendingEffect);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CompleteCodeLevel level,  int? selectedOptionIndex,  int attempts,  CompleteCodeGameplayEffect? pendingEffect)  $default,) {final _that = this;
switch (_that) {
case _CompleteCodeGameplayState():
return $default(_that.level,_that.selectedOptionIndex,_that.attempts,_that.pendingEffect);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CompleteCodeLevel level,  int? selectedOptionIndex,  int attempts,  CompleteCodeGameplayEffect? pendingEffect)?  $default,) {final _that = this;
switch (_that) {
case _CompleteCodeGameplayState() when $default != null:
return $default(_that.level,_that.selectedOptionIndex,_that.attempts,_that.pendingEffect);case _:
  return null;

}
}

}

/// @nodoc


class _CompleteCodeGameplayState implements CompleteCodeGameplayState {
  const _CompleteCodeGameplayState({required this.level, this.selectedOptionIndex, this.attempts = 0, this.pendingEffect});
  

@override final  CompleteCodeLevel level;
@override final  int? selectedOptionIndex;
@override@JsonKey() final  int attempts;
@override final  CompleteCodeGameplayEffect? pendingEffect;

/// Create a copy of CompleteCodeGameplayState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompleteCodeGameplayStateCopyWith<_CompleteCodeGameplayState> get copyWith => __$CompleteCodeGameplayStateCopyWithImpl<_CompleteCodeGameplayState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompleteCodeGameplayState&&(identical(other.level, level) || other.level == level)&&(identical(other.selectedOptionIndex, selectedOptionIndex) || other.selectedOptionIndex == selectedOptionIndex)&&(identical(other.attempts, attempts) || other.attempts == attempts)&&(identical(other.pendingEffect, pendingEffect) || other.pendingEffect == pendingEffect));
}


@override
int get hashCode => Object.hash(runtimeType,level,selectedOptionIndex,attempts,pendingEffect);

@override
String toString() {
  return 'CompleteCodeGameplayState(level: $level, selectedOptionIndex: $selectedOptionIndex, attempts: $attempts, pendingEffect: $pendingEffect)';
}


}

/// @nodoc
abstract mixin class _$CompleteCodeGameplayStateCopyWith<$Res> implements $CompleteCodeGameplayStateCopyWith<$Res> {
  factory _$CompleteCodeGameplayStateCopyWith(_CompleteCodeGameplayState value, $Res Function(_CompleteCodeGameplayState) _then) = __$CompleteCodeGameplayStateCopyWithImpl;
@override @useResult
$Res call({
 CompleteCodeLevel level, int? selectedOptionIndex, int attempts, CompleteCodeGameplayEffect? pendingEffect
});


@override $CompleteCodeGameplayEffectCopyWith<$Res>? get pendingEffect;

}
/// @nodoc
class __$CompleteCodeGameplayStateCopyWithImpl<$Res>
    implements _$CompleteCodeGameplayStateCopyWith<$Res> {
  __$CompleteCodeGameplayStateCopyWithImpl(this._self, this._then);

  final _CompleteCodeGameplayState _self;
  final $Res Function(_CompleteCodeGameplayState) _then;

/// Create a copy of CompleteCodeGameplayState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? level = null,Object? selectedOptionIndex = freezed,Object? attempts = null,Object? pendingEffect = freezed,}) {
  return _then(_CompleteCodeGameplayState(
level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as CompleteCodeLevel,selectedOptionIndex: freezed == selectedOptionIndex ? _self.selectedOptionIndex : selectedOptionIndex // ignore: cast_nullable_to_non_nullable
as int?,attempts: null == attempts ? _self.attempts : attempts // ignore: cast_nullable_to_non_nullable
as int,pendingEffect: freezed == pendingEffect ? _self.pendingEffect : pendingEffect // ignore: cast_nullable_to_non_nullable
as CompleteCodeGameplayEffect?,
  ));
}

/// Create a copy of CompleteCodeGameplayState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompleteCodeGameplayEffectCopyWith<$Res>? get pendingEffect {
    if (_self.pendingEffect == null) {
    return null;
  }

  return $CompleteCodeGameplayEffectCopyWith<$Res>(_self.pendingEffect!, (value) {
    return _then(_self.copyWith(pendingEffect: value));
  });
}
}

/// @nodoc
mixin _$CompleteCodeGameplayEffect {

 CompleteCodeResultData get data;
/// Create a copy of CompleteCodeGameplayEffect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompleteCodeGameplayEffectCopyWith<CompleteCodeGameplayEffect> get copyWith => _$CompleteCodeGameplayEffectCopyWithImpl<CompleteCodeGameplayEffect>(this as CompleteCodeGameplayEffect, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompleteCodeGameplayEffect&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'CompleteCodeGameplayEffect(data: $data)';
}


}

/// @nodoc
abstract mixin class $CompleteCodeGameplayEffectCopyWith<$Res>  {
  factory $CompleteCodeGameplayEffectCopyWith(CompleteCodeGameplayEffect value, $Res Function(CompleteCodeGameplayEffect) _then) = _$CompleteCodeGameplayEffectCopyWithImpl;
@useResult
$Res call({
 CompleteCodeResultData data
});




}
/// @nodoc
class _$CompleteCodeGameplayEffectCopyWithImpl<$Res>
    implements $CompleteCodeGameplayEffectCopyWith<$Res> {
  _$CompleteCodeGameplayEffectCopyWithImpl(this._self, this._then);

  final CompleteCodeGameplayEffect _self;
  final $Res Function(CompleteCodeGameplayEffect) _then;

/// Create a copy of CompleteCodeGameplayEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CompleteCodeResultData,
  ));
}

}


/// Adds pattern-matching-related methods to [CompleteCodeGameplayEffect].
extension CompleteCodeGameplayEffectPatterns on CompleteCodeGameplayEffect {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ShowCompleteCodeResult value)?  showResult,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ShowCompleteCodeResult() when showResult != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ShowCompleteCodeResult value)  showResult,}){
final _that = this;
switch (_that) {
case ShowCompleteCodeResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ShowCompleteCodeResult value)?  showResult,}){
final _that = this;
switch (_that) {
case ShowCompleteCodeResult() when showResult != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( CompleteCodeResultData data)?  showResult,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ShowCompleteCodeResult() when showResult != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( CompleteCodeResultData data)  showResult,}) {final _that = this;
switch (_that) {
case ShowCompleteCodeResult():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( CompleteCodeResultData data)?  showResult,}) {final _that = this;
switch (_that) {
case ShowCompleteCodeResult() when showResult != null:
return showResult(_that.data);case _:
  return null;

}
}

}

/// @nodoc


class ShowCompleteCodeResult implements CompleteCodeGameplayEffect {
  const ShowCompleteCodeResult({required this.data});
  

@override final  CompleteCodeResultData data;

/// Create a copy of CompleteCodeGameplayEffect
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShowCompleteCodeResultCopyWith<ShowCompleteCodeResult> get copyWith => _$ShowCompleteCodeResultCopyWithImpl<ShowCompleteCodeResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShowCompleteCodeResult&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'CompleteCodeGameplayEffect.showResult(data: $data)';
}


}

/// @nodoc
abstract mixin class $ShowCompleteCodeResultCopyWith<$Res> implements $CompleteCodeGameplayEffectCopyWith<$Res> {
  factory $ShowCompleteCodeResultCopyWith(ShowCompleteCodeResult value, $Res Function(ShowCompleteCodeResult) _then) = _$ShowCompleteCodeResultCopyWithImpl;
@override @useResult
$Res call({
 CompleteCodeResultData data
});




}
/// @nodoc
class _$ShowCompleteCodeResultCopyWithImpl<$Res>
    implements $ShowCompleteCodeResultCopyWith<$Res> {
  _$ShowCompleteCodeResultCopyWithImpl(this._self, this._then);

  final ShowCompleteCodeResult _self;
  final $Res Function(ShowCompleteCodeResult) _then;

/// Create a copy of CompleteCodeGameplayEffect
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(ShowCompleteCodeResult(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CompleteCodeResultData,
  ));
}


}

// dart format on
