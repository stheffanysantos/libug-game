// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingState {

 Set<int> get seenWorldNumbers; Set<int> get seenRecapWorldNumbers;/// `true` depois que o jogador já viu o intro de boas-vindas (3 slides +
/// escolha de conta) pelo menos uma vez, ao tocar "JOGAR" na Splash.
 bool get seenWelcome;
/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingStateCopyWith<OnboardingState> get copyWith => _$OnboardingStateCopyWithImpl<OnboardingState>(this as OnboardingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingState&&const DeepCollectionEquality().equals(other.seenWorldNumbers, seenWorldNumbers)&&const DeepCollectionEquality().equals(other.seenRecapWorldNumbers, seenRecapWorldNumbers)&&(identical(other.seenWelcome, seenWelcome) || other.seenWelcome == seenWelcome));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(seenWorldNumbers),const DeepCollectionEquality().hash(seenRecapWorldNumbers),seenWelcome);

@override
String toString() {
  return 'OnboardingState(seenWorldNumbers: $seenWorldNumbers, seenRecapWorldNumbers: $seenRecapWorldNumbers, seenWelcome: $seenWelcome)';
}


}

/// @nodoc
abstract mixin class $OnboardingStateCopyWith<$Res>  {
  factory $OnboardingStateCopyWith(OnboardingState value, $Res Function(OnboardingState) _then) = _$OnboardingStateCopyWithImpl;
@useResult
$Res call({
 Set<int> seenWorldNumbers, Set<int> seenRecapWorldNumbers, bool seenWelcome
});




}
/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._self, this._then);

  final OnboardingState _self;
  final $Res Function(OnboardingState) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? seenWorldNumbers = null,Object? seenRecapWorldNumbers = null,Object? seenWelcome = null,}) {
  return _then(_self.copyWith(
seenWorldNumbers: null == seenWorldNumbers ? _self.seenWorldNumbers : seenWorldNumbers // ignore: cast_nullable_to_non_nullable
as Set<int>,seenRecapWorldNumbers: null == seenRecapWorldNumbers ? _self.seenRecapWorldNumbers : seenRecapWorldNumbers // ignore: cast_nullable_to_non_nullable
as Set<int>,seenWelcome: null == seenWelcome ? _self.seenWelcome : seenWelcome // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [OnboardingState].
extension OnboardingStatePatterns on OnboardingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardingState value)  $default,){
final _that = this;
switch (_that) {
case _OnboardingState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardingState value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Set<int> seenWorldNumbers,  Set<int> seenRecapWorldNumbers,  bool seenWelcome)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
return $default(_that.seenWorldNumbers,_that.seenRecapWorldNumbers,_that.seenWelcome);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Set<int> seenWorldNumbers,  Set<int> seenRecapWorldNumbers,  bool seenWelcome)  $default,) {final _that = this;
switch (_that) {
case _OnboardingState():
return $default(_that.seenWorldNumbers,_that.seenRecapWorldNumbers,_that.seenWelcome);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Set<int> seenWorldNumbers,  Set<int> seenRecapWorldNumbers,  bool seenWelcome)?  $default,) {final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
return $default(_that.seenWorldNumbers,_that.seenRecapWorldNumbers,_that.seenWelcome);case _:
  return null;

}
}

}

/// @nodoc


class _OnboardingState extends OnboardingState {
  const _OnboardingState({final  Set<int> seenWorldNumbers = const {}, final  Set<int> seenRecapWorldNumbers = const {}, this.seenWelcome = false}): _seenWorldNumbers = seenWorldNumbers,_seenRecapWorldNumbers = seenRecapWorldNumbers,super._();
  

 final  Set<int> _seenWorldNumbers;
@override@JsonKey() Set<int> get seenWorldNumbers {
  if (_seenWorldNumbers is EqualUnmodifiableSetView) return _seenWorldNumbers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_seenWorldNumbers);
}

 final  Set<int> _seenRecapWorldNumbers;
@override@JsonKey() Set<int> get seenRecapWorldNumbers {
  if (_seenRecapWorldNumbers is EqualUnmodifiableSetView) return _seenRecapWorldNumbers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_seenRecapWorldNumbers);
}

/// `true` depois que o jogador já viu o intro de boas-vindas (3 slides +
/// escolha de conta) pelo menos uma vez, ao tocar "JOGAR" na Splash.
@override@JsonKey() final  bool seenWelcome;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingStateCopyWith<_OnboardingState> get copyWith => __$OnboardingStateCopyWithImpl<_OnboardingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingState&&const DeepCollectionEquality().equals(other._seenWorldNumbers, _seenWorldNumbers)&&const DeepCollectionEquality().equals(other._seenRecapWorldNumbers, _seenRecapWorldNumbers)&&(identical(other.seenWelcome, seenWelcome) || other.seenWelcome == seenWelcome));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_seenWorldNumbers),const DeepCollectionEquality().hash(_seenRecapWorldNumbers),seenWelcome);

@override
String toString() {
  return 'OnboardingState(seenWorldNumbers: $seenWorldNumbers, seenRecapWorldNumbers: $seenRecapWorldNumbers, seenWelcome: $seenWelcome)';
}


}

/// @nodoc
abstract mixin class _$OnboardingStateCopyWith<$Res> implements $OnboardingStateCopyWith<$Res> {
  factory _$OnboardingStateCopyWith(_OnboardingState value, $Res Function(_OnboardingState) _then) = __$OnboardingStateCopyWithImpl;
@override @useResult
$Res call({
 Set<int> seenWorldNumbers, Set<int> seenRecapWorldNumbers, bool seenWelcome
});




}
/// @nodoc
class __$OnboardingStateCopyWithImpl<$Res>
    implements _$OnboardingStateCopyWith<$Res> {
  __$OnboardingStateCopyWithImpl(this._self, this._then);

  final _OnboardingState _self;
  final $Res Function(_OnboardingState) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? seenWorldNumbers = null,Object? seenRecapWorldNumbers = null,Object? seenWelcome = null,}) {
  return _then(_OnboardingState(
seenWorldNumbers: null == seenWorldNumbers ? _self._seenWorldNumbers : seenWorldNumbers // ignore: cast_nullable_to_non_nullable
as Set<int>,seenRecapWorldNumbers: null == seenRecapWorldNumbers ? _self._seenRecapWorldNumbers : seenRecapWorldNumbers // ignore: cast_nullable_to_non_nullable
as Set<int>,seenWelcome: null == seenWelcome ? _self.seenWelcome : seenWelcome // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
