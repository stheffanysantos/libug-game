// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gameplay_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameplayState {

 Level get level; List<Block> get program; GameCursor get cursor; bool get running; int? get currentStepBlockIndex; int get attempts; int get lastRunBlocksUsed; GameplayEffect? get pendingEffect;
/// Create a copy of GameplayState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameplayStateCopyWith<GameplayState> get copyWith => _$GameplayStateCopyWithImpl<GameplayState>(this as GameplayState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameplayState&&(identical(other.level, level) || other.level == level)&&const DeepCollectionEquality().equals(other.program, program)&&(identical(other.cursor, cursor) || other.cursor == cursor)&&(identical(other.running, running) || other.running == running)&&(identical(other.currentStepBlockIndex, currentStepBlockIndex) || other.currentStepBlockIndex == currentStepBlockIndex)&&(identical(other.attempts, attempts) || other.attempts == attempts)&&(identical(other.lastRunBlocksUsed, lastRunBlocksUsed) || other.lastRunBlocksUsed == lastRunBlocksUsed)&&(identical(other.pendingEffect, pendingEffect) || other.pendingEffect == pendingEffect));
}


@override
int get hashCode => Object.hash(runtimeType,level,const DeepCollectionEquality().hash(program),cursor,running,currentStepBlockIndex,attempts,lastRunBlocksUsed,pendingEffect);

@override
String toString() {
  return 'GameplayState(level: $level, program: $program, cursor: $cursor, running: $running, currentStepBlockIndex: $currentStepBlockIndex, attempts: $attempts, lastRunBlocksUsed: $lastRunBlocksUsed, pendingEffect: $pendingEffect)';
}


}

/// @nodoc
abstract mixin class $GameplayStateCopyWith<$Res>  {
  factory $GameplayStateCopyWith(GameplayState value, $Res Function(GameplayState) _then) = _$GameplayStateCopyWithImpl;
@useResult
$Res call({
 Level level, List<Block> program, GameCursor cursor, bool running, int? currentStepBlockIndex, int attempts, int lastRunBlocksUsed, GameplayEffect? pendingEffect
});


$GameplayEffectCopyWith<$Res>? get pendingEffect;

}
/// @nodoc
class _$GameplayStateCopyWithImpl<$Res>
    implements $GameplayStateCopyWith<$Res> {
  _$GameplayStateCopyWithImpl(this._self, this._then);

  final GameplayState _self;
  final $Res Function(GameplayState) _then;

/// Create a copy of GameplayState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? level = null,Object? program = null,Object? cursor = null,Object? running = null,Object? currentStepBlockIndex = freezed,Object? attempts = null,Object? lastRunBlocksUsed = null,Object? pendingEffect = freezed,}) {
  return _then(_self.copyWith(
level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as Level,program: null == program ? _self.program : program // ignore: cast_nullable_to_non_nullable
as List<Block>,cursor: null == cursor ? _self.cursor : cursor // ignore: cast_nullable_to_non_nullable
as GameCursor,running: null == running ? _self.running : running // ignore: cast_nullable_to_non_nullable
as bool,currentStepBlockIndex: freezed == currentStepBlockIndex ? _self.currentStepBlockIndex : currentStepBlockIndex // ignore: cast_nullable_to_non_nullable
as int?,attempts: null == attempts ? _self.attempts : attempts // ignore: cast_nullable_to_non_nullable
as int,lastRunBlocksUsed: null == lastRunBlocksUsed ? _self.lastRunBlocksUsed : lastRunBlocksUsed // ignore: cast_nullable_to_non_nullable
as int,pendingEffect: freezed == pendingEffect ? _self.pendingEffect : pendingEffect // ignore: cast_nullable_to_non_nullable
as GameplayEffect?,
  ));
}
/// Create a copy of GameplayState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GameplayEffectCopyWith<$Res>? get pendingEffect {
    if (_self.pendingEffect == null) {
    return null;
  }

  return $GameplayEffectCopyWith<$Res>(_self.pendingEffect!, (value) {
    return _then(_self.copyWith(pendingEffect: value));
  });
}
}


/// Adds pattern-matching-related methods to [GameplayState].
extension GameplayStatePatterns on GameplayState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameplayState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameplayState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameplayState value)  $default,){
final _that = this;
switch (_that) {
case _GameplayState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameplayState value)?  $default,){
final _that = this;
switch (_that) {
case _GameplayState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Level level,  List<Block> program,  GameCursor cursor,  bool running,  int? currentStepBlockIndex,  int attempts,  int lastRunBlocksUsed,  GameplayEffect? pendingEffect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameplayState() when $default != null:
return $default(_that.level,_that.program,_that.cursor,_that.running,_that.currentStepBlockIndex,_that.attempts,_that.lastRunBlocksUsed,_that.pendingEffect);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Level level,  List<Block> program,  GameCursor cursor,  bool running,  int? currentStepBlockIndex,  int attempts,  int lastRunBlocksUsed,  GameplayEffect? pendingEffect)  $default,) {final _that = this;
switch (_that) {
case _GameplayState():
return $default(_that.level,_that.program,_that.cursor,_that.running,_that.currentStepBlockIndex,_that.attempts,_that.lastRunBlocksUsed,_that.pendingEffect);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Level level,  List<Block> program,  GameCursor cursor,  bool running,  int? currentStepBlockIndex,  int attempts,  int lastRunBlocksUsed,  GameplayEffect? pendingEffect)?  $default,) {final _that = this;
switch (_that) {
case _GameplayState() when $default != null:
return $default(_that.level,_that.program,_that.cursor,_that.running,_that.currentStepBlockIndex,_that.attempts,_that.lastRunBlocksUsed,_that.pendingEffect);case _:
  return null;

}
}

}

/// @nodoc


class _GameplayState implements GameplayState {
  const _GameplayState({required this.level, final  List<Block> program = const <Block>[], required this.cursor, this.running = false, this.currentStepBlockIndex, this.attempts = 0, this.lastRunBlocksUsed = 0, this.pendingEffect}): _program = program;
  

@override final  Level level;
 final  List<Block> _program;
@override@JsonKey() List<Block> get program {
  if (_program is EqualUnmodifiableListView) return _program;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_program);
}

@override final  GameCursor cursor;
@override@JsonKey() final  bool running;
@override final  int? currentStepBlockIndex;
@override@JsonKey() final  int attempts;
@override@JsonKey() final  int lastRunBlocksUsed;
@override final  GameplayEffect? pendingEffect;

/// Create a copy of GameplayState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameplayStateCopyWith<_GameplayState> get copyWith => __$GameplayStateCopyWithImpl<_GameplayState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameplayState&&(identical(other.level, level) || other.level == level)&&const DeepCollectionEquality().equals(other._program, _program)&&(identical(other.cursor, cursor) || other.cursor == cursor)&&(identical(other.running, running) || other.running == running)&&(identical(other.currentStepBlockIndex, currentStepBlockIndex) || other.currentStepBlockIndex == currentStepBlockIndex)&&(identical(other.attempts, attempts) || other.attempts == attempts)&&(identical(other.lastRunBlocksUsed, lastRunBlocksUsed) || other.lastRunBlocksUsed == lastRunBlocksUsed)&&(identical(other.pendingEffect, pendingEffect) || other.pendingEffect == pendingEffect));
}


@override
int get hashCode => Object.hash(runtimeType,level,const DeepCollectionEquality().hash(_program),cursor,running,currentStepBlockIndex,attempts,lastRunBlocksUsed,pendingEffect);

@override
String toString() {
  return 'GameplayState(level: $level, program: $program, cursor: $cursor, running: $running, currentStepBlockIndex: $currentStepBlockIndex, attempts: $attempts, lastRunBlocksUsed: $lastRunBlocksUsed, pendingEffect: $pendingEffect)';
}


}

/// @nodoc
abstract mixin class _$GameplayStateCopyWith<$Res> implements $GameplayStateCopyWith<$Res> {
  factory _$GameplayStateCopyWith(_GameplayState value, $Res Function(_GameplayState) _then) = __$GameplayStateCopyWithImpl;
@override @useResult
$Res call({
 Level level, List<Block> program, GameCursor cursor, bool running, int? currentStepBlockIndex, int attempts, int lastRunBlocksUsed, GameplayEffect? pendingEffect
});


@override $GameplayEffectCopyWith<$Res>? get pendingEffect;

}
/// @nodoc
class __$GameplayStateCopyWithImpl<$Res>
    implements _$GameplayStateCopyWith<$Res> {
  __$GameplayStateCopyWithImpl(this._self, this._then);

  final _GameplayState _self;
  final $Res Function(_GameplayState) _then;

/// Create a copy of GameplayState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? level = null,Object? program = null,Object? cursor = null,Object? running = null,Object? currentStepBlockIndex = freezed,Object? attempts = null,Object? lastRunBlocksUsed = null,Object? pendingEffect = freezed,}) {
  return _then(_GameplayState(
level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as Level,program: null == program ? _self._program : program // ignore: cast_nullable_to_non_nullable
as List<Block>,cursor: null == cursor ? _self.cursor : cursor // ignore: cast_nullable_to_non_nullable
as GameCursor,running: null == running ? _self.running : running // ignore: cast_nullable_to_non_nullable
as bool,currentStepBlockIndex: freezed == currentStepBlockIndex ? _self.currentStepBlockIndex : currentStepBlockIndex // ignore: cast_nullable_to_non_nullable
as int?,attempts: null == attempts ? _self.attempts : attempts // ignore: cast_nullable_to_non_nullable
as int,lastRunBlocksUsed: null == lastRunBlocksUsed ? _self.lastRunBlocksUsed : lastRunBlocksUsed // ignore: cast_nullable_to_non_nullable
as int,pendingEffect: freezed == pendingEffect ? _self.pendingEffect : pendingEffect // ignore: cast_nullable_to_non_nullable
as GameplayEffect?,
  ));
}

/// Create a copy of GameplayState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GameplayEffectCopyWith<$Res>? get pendingEffect {
    if (_self.pendingEffect == null) {
    return null;
  }

  return $GameplayEffectCopyWith<$Res>(_self.pendingEffect!, (value) {
    return _then(_self.copyWith(pendingEffect: value));
  });
}
}

/// @nodoc
mixin _$GameplayEffect {

 Object get data;



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameplayEffect&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'GameplayEffect(data: $data)';
}


}

/// @nodoc
class $GameplayEffectCopyWith<$Res>  {
$GameplayEffectCopyWith(GameplayEffect _, $Res Function(GameplayEffect) __);
}


/// Adds pattern-matching-related methods to [GameplayEffect].
extension GameplayEffectPatterns on GameplayEffect {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NavigateToVictory value)?  navigateToVictory,TResult Function( NavigateToFailure value)?  navigateToFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NavigateToVictory() when navigateToVictory != null:
return navigateToVictory(_that);case NavigateToFailure() when navigateToFailure != null:
return navigateToFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NavigateToVictory value)  navigateToVictory,required TResult Function( NavigateToFailure value)  navigateToFailure,}){
final _that = this;
switch (_that) {
case NavigateToVictory():
return navigateToVictory(_that);case NavigateToFailure():
return navigateToFailure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NavigateToVictory value)?  navigateToVictory,TResult? Function( NavigateToFailure value)?  navigateToFailure,}){
final _that = this;
switch (_that) {
case NavigateToVictory() when navigateToVictory != null:
return navigateToVictory(_that);case NavigateToFailure() when navigateToFailure != null:
return navigateToFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( GameplayVictoryData data)?  navigateToVictory,TResult Function( GameplayFailureData data)?  navigateToFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NavigateToVictory() when navigateToVictory != null:
return navigateToVictory(_that.data);case NavigateToFailure() when navigateToFailure != null:
return navigateToFailure(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( GameplayVictoryData data)  navigateToVictory,required TResult Function( GameplayFailureData data)  navigateToFailure,}) {final _that = this;
switch (_that) {
case NavigateToVictory():
return navigateToVictory(_that.data);case NavigateToFailure():
return navigateToFailure(_that.data);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( GameplayVictoryData data)?  navigateToVictory,TResult? Function( GameplayFailureData data)?  navigateToFailure,}) {final _that = this;
switch (_that) {
case NavigateToVictory() when navigateToVictory != null:
return navigateToVictory(_that.data);case NavigateToFailure() when navigateToFailure != null:
return navigateToFailure(_that.data);case _:
  return null;

}
}

}

/// @nodoc


class NavigateToVictory implements GameplayEffect {
  const NavigateToVictory({required this.data});
  

@override final  GameplayVictoryData data;

/// Create a copy of GameplayEffect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigateToVictoryCopyWith<NavigateToVictory> get copyWith => _$NavigateToVictoryCopyWithImpl<NavigateToVictory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigateToVictory&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'GameplayEffect.navigateToVictory(data: $data)';
}


}

/// @nodoc
abstract mixin class $NavigateToVictoryCopyWith<$Res> implements $GameplayEffectCopyWith<$Res> {
  factory $NavigateToVictoryCopyWith(NavigateToVictory value, $Res Function(NavigateToVictory) _then) = _$NavigateToVictoryCopyWithImpl;
@useResult
$Res call({
 GameplayVictoryData data
});




}
/// @nodoc
class _$NavigateToVictoryCopyWithImpl<$Res>
    implements $NavigateToVictoryCopyWith<$Res> {
  _$NavigateToVictoryCopyWithImpl(this._self, this._then);

  final NavigateToVictory _self;
  final $Res Function(NavigateToVictory) _then;

/// Create a copy of GameplayEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(NavigateToVictory(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as GameplayVictoryData,
  ));
}


}

/// @nodoc


class NavigateToFailure implements GameplayEffect {
  const NavigateToFailure({required this.data});
  

@override final  GameplayFailureData data;

/// Create a copy of GameplayEffect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigateToFailureCopyWith<NavigateToFailure> get copyWith => _$NavigateToFailureCopyWithImpl<NavigateToFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigateToFailure&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'GameplayEffect.navigateToFailure(data: $data)';
}


}

/// @nodoc
abstract mixin class $NavigateToFailureCopyWith<$Res> implements $GameplayEffectCopyWith<$Res> {
  factory $NavigateToFailureCopyWith(NavigateToFailure value, $Res Function(NavigateToFailure) _then) = _$NavigateToFailureCopyWithImpl;
@useResult
$Res call({
 GameplayFailureData data
});




}
/// @nodoc
class _$NavigateToFailureCopyWithImpl<$Res>
    implements $NavigateToFailureCopyWith<$Res> {
  _$NavigateToFailureCopyWithImpl(this._self, this._then);

  final NavigateToFailure _self;
  final $Res Function(NavigateToFailure) _then;

/// Create a copy of GameplayEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(NavigateToFailure(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as GameplayFailureData,
  ));
}


}

// dart format on
