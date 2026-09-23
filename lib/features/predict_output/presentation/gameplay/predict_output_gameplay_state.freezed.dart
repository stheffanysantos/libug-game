// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'predict_output_gameplay_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PredictOutputGameplayState {

 PredictOutputLevel get level; int? get selectedOptionIndex; int get attempts; PredictOutputGameplayEffect? get pendingEffect;
/// Create a copy of PredictOutputGameplayState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PredictOutputGameplayStateCopyWith<PredictOutputGameplayState> get copyWith => _$PredictOutputGameplayStateCopyWithImpl<PredictOutputGameplayState>(this as PredictOutputGameplayState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PredictOutputGameplayState&&(identical(other.level, level) || other.level == level)&&(identical(other.selectedOptionIndex, selectedOptionIndex) || other.selectedOptionIndex == selectedOptionIndex)&&(identical(other.attempts, attempts) || other.attempts == attempts)&&(identical(other.pendingEffect, pendingEffect) || other.pendingEffect == pendingEffect));
}


@override
int get hashCode => Object.hash(runtimeType,level,selectedOptionIndex,attempts,pendingEffect);

@override
String toString() {
  return 'PredictOutputGameplayState(level: $level, selectedOptionIndex: $selectedOptionIndex, attempts: $attempts, pendingEffect: $pendingEffect)';
}


}

/// @nodoc
abstract mixin class $PredictOutputGameplayStateCopyWith<$Res>  {
  factory $PredictOutputGameplayStateCopyWith(PredictOutputGameplayState value, $Res Function(PredictOutputGameplayState) _then) = _$PredictOutputGameplayStateCopyWithImpl;
@useResult
$Res call({
 PredictOutputLevel level, int? selectedOptionIndex, int attempts, PredictOutputGameplayEffect? pendingEffect
});


$PredictOutputGameplayEffectCopyWith<$Res>? get pendingEffect;

}
/// @nodoc
class _$PredictOutputGameplayStateCopyWithImpl<$Res>
    implements $PredictOutputGameplayStateCopyWith<$Res> {
  _$PredictOutputGameplayStateCopyWithImpl(this._self, this._then);

  final PredictOutputGameplayState _self;
  final $Res Function(PredictOutputGameplayState) _then;

/// Create a copy of PredictOutputGameplayState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? level = null,Object? selectedOptionIndex = freezed,Object? attempts = null,Object? pendingEffect = freezed,}) {
  return _then(_self.copyWith(
level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as PredictOutputLevel,selectedOptionIndex: freezed == selectedOptionIndex ? _self.selectedOptionIndex : selectedOptionIndex // ignore: cast_nullable_to_non_nullable
as int?,attempts: null == attempts ? _self.attempts : attempts // ignore: cast_nullable_to_non_nullable
as int,pendingEffect: freezed == pendingEffect ? _self.pendingEffect : pendingEffect // ignore: cast_nullable_to_non_nullable
as PredictOutputGameplayEffect?,
  ));
}
/// Create a copy of PredictOutputGameplayState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PredictOutputGameplayEffectCopyWith<$Res>? get pendingEffect {
    if (_self.pendingEffect == null) {
    return null;
  }

  return $PredictOutputGameplayEffectCopyWith<$Res>(_self.pendingEffect!, (value) {
    return _then(_self.copyWith(pendingEffect: value));
  });
}
}


/// Adds pattern-matching-related methods to [PredictOutputGameplayState].
extension PredictOutputGameplayStatePatterns on PredictOutputGameplayState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PredictOutputGameplayState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PredictOutputGameplayState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PredictOutputGameplayState value)  $default,){
final _that = this;
switch (_that) {
case _PredictOutputGameplayState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PredictOutputGameplayState value)?  $default,){
final _that = this;
switch (_that) {
case _PredictOutputGameplayState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PredictOutputLevel level,  int? selectedOptionIndex,  int attempts,  PredictOutputGameplayEffect? pendingEffect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PredictOutputGameplayState() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PredictOutputLevel level,  int? selectedOptionIndex,  int attempts,  PredictOutputGameplayEffect? pendingEffect)  $default,) {final _that = this;
switch (_that) {
case _PredictOutputGameplayState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PredictOutputLevel level,  int? selectedOptionIndex,  int attempts,  PredictOutputGameplayEffect? pendingEffect)?  $default,) {final _that = this;
switch (_that) {
case _PredictOutputGameplayState() when $default != null:
return $default(_that.level,_that.selectedOptionIndex,_that.attempts,_that.pendingEffect);case _:
  return null;

}
}

}

/// @nodoc


class _PredictOutputGameplayState implements PredictOutputGameplayState {
  const _PredictOutputGameplayState({required this.level, this.selectedOptionIndex, this.attempts = 0, this.pendingEffect});
  

@override final  PredictOutputLevel level;
@override final  int? selectedOptionIndex;
@override@JsonKey() final  int attempts;
@override final  PredictOutputGameplayEffect? pendingEffect;

/// Create a copy of PredictOutputGameplayState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PredictOutputGameplayStateCopyWith<_PredictOutputGameplayState> get copyWith => __$PredictOutputGameplayStateCopyWithImpl<_PredictOutputGameplayState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PredictOutputGameplayState&&(identical(other.level, level) || other.level == level)&&(identical(other.selectedOptionIndex, selectedOptionIndex) || other.selectedOptionIndex == selectedOptionIndex)&&(identical(other.attempts, attempts) || other.attempts == attempts)&&(identical(other.pendingEffect, pendingEffect) || other.pendingEffect == pendingEffect));
}


@override
int get hashCode => Object.hash(runtimeType,level,selectedOptionIndex,attempts,pendingEffect);

@override
String toString() {
  return 'PredictOutputGameplayState(level: $level, selectedOptionIndex: $selectedOptionIndex, attempts: $attempts, pendingEffect: $pendingEffect)';
}


}

/// @nodoc
abstract mixin class _$PredictOutputGameplayStateCopyWith<$Res> implements $PredictOutputGameplayStateCopyWith<$Res> {
  factory _$PredictOutputGameplayStateCopyWith(_PredictOutputGameplayState value, $Res Function(_PredictOutputGameplayState) _then) = __$PredictOutputGameplayStateCopyWithImpl;
@override @useResult
$Res call({
 PredictOutputLevel level, int? selectedOptionIndex, int attempts, PredictOutputGameplayEffect? pendingEffect
});


@override $PredictOutputGameplayEffectCopyWith<$Res>? get pendingEffect;

}
/// @nodoc
class __$PredictOutputGameplayStateCopyWithImpl<$Res>
    implements _$PredictOutputGameplayStateCopyWith<$Res> {
  __$PredictOutputGameplayStateCopyWithImpl(this._self, this._then);

  final _PredictOutputGameplayState _self;
  final $Res Function(_PredictOutputGameplayState) _then;

/// Create a copy of PredictOutputGameplayState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? level = null,Object? selectedOptionIndex = freezed,Object? attempts = null,Object? pendingEffect = freezed,}) {
  return _then(_PredictOutputGameplayState(
level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as PredictOutputLevel,selectedOptionIndex: freezed == selectedOptionIndex ? _self.selectedOptionIndex : selectedOptionIndex // ignore: cast_nullable_to_non_nullable
as int?,attempts: null == attempts ? _self.attempts : attempts // ignore: cast_nullable_to_non_nullable
as int,pendingEffect: freezed == pendingEffect ? _self.pendingEffect : pendingEffect // ignore: cast_nullable_to_non_nullable
as PredictOutputGameplayEffect?,
  ));
}

/// Create a copy of PredictOutputGameplayState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PredictOutputGameplayEffectCopyWith<$Res>? get pendingEffect {
    if (_self.pendingEffect == null) {
    return null;
  }

  return $PredictOutputGameplayEffectCopyWith<$Res>(_self.pendingEffect!, (value) {
    return _then(_self.copyWith(pendingEffect: value));
  });
}
}

/// @nodoc
mixin _$PredictOutputGameplayEffect {

 PredictOutputResultData get data;
/// Create a copy of PredictOutputGameplayEffect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PredictOutputGameplayEffectCopyWith<PredictOutputGameplayEffect> get copyWith => _$PredictOutputGameplayEffectCopyWithImpl<PredictOutputGameplayEffect>(this as PredictOutputGameplayEffect, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PredictOutputGameplayEffect&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'PredictOutputGameplayEffect(data: $data)';
}


}

/// @nodoc
abstract mixin class $PredictOutputGameplayEffectCopyWith<$Res>  {
  factory $PredictOutputGameplayEffectCopyWith(PredictOutputGameplayEffect value, $Res Function(PredictOutputGameplayEffect) _then) = _$PredictOutputGameplayEffectCopyWithImpl;
@useResult
$Res call({
 PredictOutputResultData data
});




}
/// @nodoc
class _$PredictOutputGameplayEffectCopyWithImpl<$Res>
    implements $PredictOutputGameplayEffectCopyWith<$Res> {
  _$PredictOutputGameplayEffectCopyWithImpl(this._self, this._then);

  final PredictOutputGameplayEffect _self;
  final $Res Function(PredictOutputGameplayEffect) _then;

/// Create a copy of PredictOutputGameplayEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as PredictOutputResultData,
  ));
}

}


/// Adds pattern-matching-related methods to [PredictOutputGameplayEffect].
extension PredictOutputGameplayEffectPatterns on PredictOutputGameplayEffect {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ShowPredictOutputResult value)?  showResult,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ShowPredictOutputResult() when showResult != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ShowPredictOutputResult value)  showResult,}){
final _that = this;
switch (_that) {
case ShowPredictOutputResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ShowPredictOutputResult value)?  showResult,}){
final _that = this;
switch (_that) {
case ShowPredictOutputResult() when showResult != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( PredictOutputResultData data)?  showResult,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ShowPredictOutputResult() when showResult != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( PredictOutputResultData data)  showResult,}) {final _that = this;
switch (_that) {
case ShowPredictOutputResult():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( PredictOutputResultData data)?  showResult,}) {final _that = this;
switch (_that) {
case ShowPredictOutputResult() when showResult != null:
return showResult(_that.data);case _:
  return null;

}
}

}

/// @nodoc


class ShowPredictOutputResult implements PredictOutputGameplayEffect {
  const ShowPredictOutputResult({required this.data});
  

@override final  PredictOutputResultData data;

/// Create a copy of PredictOutputGameplayEffect
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShowPredictOutputResultCopyWith<ShowPredictOutputResult> get copyWith => _$ShowPredictOutputResultCopyWithImpl<ShowPredictOutputResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShowPredictOutputResult&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'PredictOutputGameplayEffect.showResult(data: $data)';
}


}

/// @nodoc
abstract mixin class $ShowPredictOutputResultCopyWith<$Res> implements $PredictOutputGameplayEffectCopyWith<$Res> {
  factory $ShowPredictOutputResultCopyWith(ShowPredictOutputResult value, $Res Function(ShowPredictOutputResult) _then) = _$ShowPredictOutputResultCopyWithImpl;
@override @useResult
$Res call({
 PredictOutputResultData data
});




}
/// @nodoc
class _$ShowPredictOutputResultCopyWithImpl<$Res>
    implements $ShowPredictOutputResultCopyWith<$Res> {
  _$ShowPredictOutputResultCopyWithImpl(this._self, this._then);

  final ShowPredictOutputResult _self;
  final $Res Function(ShowPredictOutputResult) _then;

/// Create a copy of PredictOutputGameplayEffect
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(ShowPredictOutputResult(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as PredictOutputResultData,
  ));
}


}

// dart format on
