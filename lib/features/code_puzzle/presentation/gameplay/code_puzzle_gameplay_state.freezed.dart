// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'code_puzzle_gameplay_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CodePuzzleGameplayState {

 CodePuzzleLevel get level;/// Índices (em `CodePuzzleGameplayViewModel.shuffledLines`) já tocados
/// para montar a sequência, na ordem em que o jogador tocou — só usado
/// em fases `reorder`.
 List<int> get sequenceIndices;/// Linha tocada como "essa é a errada" — só usado em fases `findBug`.
 int? get selectedLineIndex; int get attempts; CodePuzzleGameplayEffect? get pendingEffect;
/// Create a copy of CodePuzzleGameplayState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CodePuzzleGameplayStateCopyWith<CodePuzzleGameplayState> get copyWith => _$CodePuzzleGameplayStateCopyWithImpl<CodePuzzleGameplayState>(this as CodePuzzleGameplayState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CodePuzzleGameplayState&&(identical(other.level, level) || other.level == level)&&const DeepCollectionEquality().equals(other.sequenceIndices, sequenceIndices)&&(identical(other.selectedLineIndex, selectedLineIndex) || other.selectedLineIndex == selectedLineIndex)&&(identical(other.attempts, attempts) || other.attempts == attempts)&&(identical(other.pendingEffect, pendingEffect) || other.pendingEffect == pendingEffect));
}


@override
int get hashCode => Object.hash(runtimeType,level,const DeepCollectionEquality().hash(sequenceIndices),selectedLineIndex,attempts,pendingEffect);

@override
String toString() {
  return 'CodePuzzleGameplayState(level: $level, sequenceIndices: $sequenceIndices, selectedLineIndex: $selectedLineIndex, attempts: $attempts, pendingEffect: $pendingEffect)';
}


}

/// @nodoc
abstract mixin class $CodePuzzleGameplayStateCopyWith<$Res>  {
  factory $CodePuzzleGameplayStateCopyWith(CodePuzzleGameplayState value, $Res Function(CodePuzzleGameplayState) _then) = _$CodePuzzleGameplayStateCopyWithImpl;
@useResult
$Res call({
 CodePuzzleLevel level, List<int> sequenceIndices, int? selectedLineIndex, int attempts, CodePuzzleGameplayEffect? pendingEffect
});


$CodePuzzleGameplayEffectCopyWith<$Res>? get pendingEffect;

}
/// @nodoc
class _$CodePuzzleGameplayStateCopyWithImpl<$Res>
    implements $CodePuzzleGameplayStateCopyWith<$Res> {
  _$CodePuzzleGameplayStateCopyWithImpl(this._self, this._then);

  final CodePuzzleGameplayState _self;
  final $Res Function(CodePuzzleGameplayState) _then;

/// Create a copy of CodePuzzleGameplayState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? level = null,Object? sequenceIndices = null,Object? selectedLineIndex = freezed,Object? attempts = null,Object? pendingEffect = freezed,}) {
  return _then(_self.copyWith(
level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as CodePuzzleLevel,sequenceIndices: null == sequenceIndices ? _self.sequenceIndices : sequenceIndices // ignore: cast_nullable_to_non_nullable
as List<int>,selectedLineIndex: freezed == selectedLineIndex ? _self.selectedLineIndex : selectedLineIndex // ignore: cast_nullable_to_non_nullable
as int?,attempts: null == attempts ? _self.attempts : attempts // ignore: cast_nullable_to_non_nullable
as int,pendingEffect: freezed == pendingEffect ? _self.pendingEffect : pendingEffect // ignore: cast_nullable_to_non_nullable
as CodePuzzleGameplayEffect?,
  ));
}
/// Create a copy of CodePuzzleGameplayState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CodePuzzleGameplayEffectCopyWith<$Res>? get pendingEffect {
    if (_self.pendingEffect == null) {
    return null;
  }

  return $CodePuzzleGameplayEffectCopyWith<$Res>(_self.pendingEffect!, (value) {
    return _then(_self.copyWith(pendingEffect: value));
  });
}
}


/// Adds pattern-matching-related methods to [CodePuzzleGameplayState].
extension CodePuzzleGameplayStatePatterns on CodePuzzleGameplayState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CodePuzzleGameplayState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CodePuzzleGameplayState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CodePuzzleGameplayState value)  $default,){
final _that = this;
switch (_that) {
case _CodePuzzleGameplayState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CodePuzzleGameplayState value)?  $default,){
final _that = this;
switch (_that) {
case _CodePuzzleGameplayState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CodePuzzleLevel level,  List<int> sequenceIndices,  int? selectedLineIndex,  int attempts,  CodePuzzleGameplayEffect? pendingEffect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CodePuzzleGameplayState() when $default != null:
return $default(_that.level,_that.sequenceIndices,_that.selectedLineIndex,_that.attempts,_that.pendingEffect);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CodePuzzleLevel level,  List<int> sequenceIndices,  int? selectedLineIndex,  int attempts,  CodePuzzleGameplayEffect? pendingEffect)  $default,) {final _that = this;
switch (_that) {
case _CodePuzzleGameplayState():
return $default(_that.level,_that.sequenceIndices,_that.selectedLineIndex,_that.attempts,_that.pendingEffect);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CodePuzzleLevel level,  List<int> sequenceIndices,  int? selectedLineIndex,  int attempts,  CodePuzzleGameplayEffect? pendingEffect)?  $default,) {final _that = this;
switch (_that) {
case _CodePuzzleGameplayState() when $default != null:
return $default(_that.level,_that.sequenceIndices,_that.selectedLineIndex,_that.attempts,_that.pendingEffect);case _:
  return null;

}
}

}

/// @nodoc


class _CodePuzzleGameplayState implements CodePuzzleGameplayState {
  const _CodePuzzleGameplayState({required this.level, final  List<int> sequenceIndices = const <int>[], this.selectedLineIndex, this.attempts = 0, this.pendingEffect}): _sequenceIndices = sequenceIndices;
  

@override final  CodePuzzleLevel level;
/// Índices (em `CodePuzzleGameplayViewModel.shuffledLines`) já tocados
/// para montar a sequência, na ordem em que o jogador tocou — só usado
/// em fases `reorder`.
 final  List<int> _sequenceIndices;
/// Índices (em `CodePuzzleGameplayViewModel.shuffledLines`) já tocados
/// para montar a sequência, na ordem em que o jogador tocou — só usado
/// em fases `reorder`.
@override@JsonKey() List<int> get sequenceIndices {
  if (_sequenceIndices is EqualUnmodifiableListView) return _sequenceIndices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sequenceIndices);
}

/// Linha tocada como "essa é a errada" — só usado em fases `findBug`.
@override final  int? selectedLineIndex;
@override@JsonKey() final  int attempts;
@override final  CodePuzzleGameplayEffect? pendingEffect;

/// Create a copy of CodePuzzleGameplayState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CodePuzzleGameplayStateCopyWith<_CodePuzzleGameplayState> get copyWith => __$CodePuzzleGameplayStateCopyWithImpl<_CodePuzzleGameplayState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CodePuzzleGameplayState&&(identical(other.level, level) || other.level == level)&&const DeepCollectionEquality().equals(other._sequenceIndices, _sequenceIndices)&&(identical(other.selectedLineIndex, selectedLineIndex) || other.selectedLineIndex == selectedLineIndex)&&(identical(other.attempts, attempts) || other.attempts == attempts)&&(identical(other.pendingEffect, pendingEffect) || other.pendingEffect == pendingEffect));
}


@override
int get hashCode => Object.hash(runtimeType,level,const DeepCollectionEquality().hash(_sequenceIndices),selectedLineIndex,attempts,pendingEffect);

@override
String toString() {
  return 'CodePuzzleGameplayState(level: $level, sequenceIndices: $sequenceIndices, selectedLineIndex: $selectedLineIndex, attempts: $attempts, pendingEffect: $pendingEffect)';
}


}

/// @nodoc
abstract mixin class _$CodePuzzleGameplayStateCopyWith<$Res> implements $CodePuzzleGameplayStateCopyWith<$Res> {
  factory _$CodePuzzleGameplayStateCopyWith(_CodePuzzleGameplayState value, $Res Function(_CodePuzzleGameplayState) _then) = __$CodePuzzleGameplayStateCopyWithImpl;
@override @useResult
$Res call({
 CodePuzzleLevel level, List<int> sequenceIndices, int? selectedLineIndex, int attempts, CodePuzzleGameplayEffect? pendingEffect
});


@override $CodePuzzleGameplayEffectCopyWith<$Res>? get pendingEffect;

}
/// @nodoc
class __$CodePuzzleGameplayStateCopyWithImpl<$Res>
    implements _$CodePuzzleGameplayStateCopyWith<$Res> {
  __$CodePuzzleGameplayStateCopyWithImpl(this._self, this._then);

  final _CodePuzzleGameplayState _self;
  final $Res Function(_CodePuzzleGameplayState) _then;

/// Create a copy of CodePuzzleGameplayState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? level = null,Object? sequenceIndices = null,Object? selectedLineIndex = freezed,Object? attempts = null,Object? pendingEffect = freezed,}) {
  return _then(_CodePuzzleGameplayState(
level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as CodePuzzleLevel,sequenceIndices: null == sequenceIndices ? _self._sequenceIndices : sequenceIndices // ignore: cast_nullable_to_non_nullable
as List<int>,selectedLineIndex: freezed == selectedLineIndex ? _self.selectedLineIndex : selectedLineIndex // ignore: cast_nullable_to_non_nullable
as int?,attempts: null == attempts ? _self.attempts : attempts // ignore: cast_nullable_to_non_nullable
as int,pendingEffect: freezed == pendingEffect ? _self.pendingEffect : pendingEffect // ignore: cast_nullable_to_non_nullable
as CodePuzzleGameplayEffect?,
  ));
}

/// Create a copy of CodePuzzleGameplayState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CodePuzzleGameplayEffectCopyWith<$Res>? get pendingEffect {
    if (_self.pendingEffect == null) {
    return null;
  }

  return $CodePuzzleGameplayEffectCopyWith<$Res>(_self.pendingEffect!, (value) {
    return _then(_self.copyWith(pendingEffect: value));
  });
}
}

/// @nodoc
mixin _$CodePuzzleGameplayEffect {

 CodePuzzleGameplayResultData get data;
/// Create a copy of CodePuzzleGameplayEffect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CodePuzzleGameplayEffectCopyWith<CodePuzzleGameplayEffect> get copyWith => _$CodePuzzleGameplayEffectCopyWithImpl<CodePuzzleGameplayEffect>(this as CodePuzzleGameplayEffect, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CodePuzzleGameplayEffect&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'CodePuzzleGameplayEffect(data: $data)';
}


}

/// @nodoc
abstract mixin class $CodePuzzleGameplayEffectCopyWith<$Res>  {
  factory $CodePuzzleGameplayEffectCopyWith(CodePuzzleGameplayEffect value, $Res Function(CodePuzzleGameplayEffect) _then) = _$CodePuzzleGameplayEffectCopyWithImpl;
@useResult
$Res call({
 CodePuzzleGameplayResultData data
});




}
/// @nodoc
class _$CodePuzzleGameplayEffectCopyWithImpl<$Res>
    implements $CodePuzzleGameplayEffectCopyWith<$Res> {
  _$CodePuzzleGameplayEffectCopyWithImpl(this._self, this._then);

  final CodePuzzleGameplayEffect _self;
  final $Res Function(CodePuzzleGameplayEffect) _then;

/// Create a copy of CodePuzzleGameplayEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CodePuzzleGameplayResultData,
  ));
}

}


/// Adds pattern-matching-related methods to [CodePuzzleGameplayEffect].
extension CodePuzzleGameplayEffectPatterns on CodePuzzleGameplayEffect {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ShowCodePuzzleGameplayResult value)?  showResult,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ShowCodePuzzleGameplayResult() when showResult != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ShowCodePuzzleGameplayResult value)  showResult,}){
final _that = this;
switch (_that) {
case ShowCodePuzzleGameplayResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ShowCodePuzzleGameplayResult value)?  showResult,}){
final _that = this;
switch (_that) {
case ShowCodePuzzleGameplayResult() when showResult != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( CodePuzzleGameplayResultData data)?  showResult,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ShowCodePuzzleGameplayResult() when showResult != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( CodePuzzleGameplayResultData data)  showResult,}) {final _that = this;
switch (_that) {
case ShowCodePuzzleGameplayResult():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( CodePuzzleGameplayResultData data)?  showResult,}) {final _that = this;
switch (_that) {
case ShowCodePuzzleGameplayResult() when showResult != null:
return showResult(_that.data);case _:
  return null;

}
}

}

/// @nodoc


class ShowCodePuzzleGameplayResult implements CodePuzzleGameplayEffect {
  const ShowCodePuzzleGameplayResult({required this.data});
  

@override final  CodePuzzleGameplayResultData data;

/// Create a copy of CodePuzzleGameplayEffect
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShowCodePuzzleGameplayResultCopyWith<ShowCodePuzzleGameplayResult> get copyWith => _$ShowCodePuzzleGameplayResultCopyWithImpl<ShowCodePuzzleGameplayResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShowCodePuzzleGameplayResult&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'CodePuzzleGameplayEffect.showResult(data: $data)';
}


}

/// @nodoc
abstract mixin class $ShowCodePuzzleGameplayResultCopyWith<$Res> implements $CodePuzzleGameplayEffectCopyWith<$Res> {
  factory $ShowCodePuzzleGameplayResultCopyWith(ShowCodePuzzleGameplayResult value, $Res Function(ShowCodePuzzleGameplayResult) _then) = _$ShowCodePuzzleGameplayResultCopyWithImpl;
@override @useResult
$Res call({
 CodePuzzleGameplayResultData data
});




}
/// @nodoc
class _$ShowCodePuzzleGameplayResultCopyWithImpl<$Res>
    implements $ShowCodePuzzleGameplayResultCopyWith<$Res> {
  _$ShowCodePuzzleGameplayResultCopyWithImpl(this._self, this._then);

  final ShowCodePuzzleGameplayResult _self;
  final $Res Function(ShowCodePuzzleGameplayResult) _then;

/// Create a copy of CodePuzzleGameplayEffect
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(ShowCodePuzzleGameplayResult(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CodePuzzleGameplayResultData,
  ));
}


}

// dart format on
