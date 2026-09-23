// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProgressState {

 Map<String, LevelProgress> get byLevelId;/// Pontuação acumulada nesta sessão para o Placar do Dia — separada do
/// "PONTOS" por fase (`LevelProgress` não guarda isso).
 int get sessionScore;/// `true` depois que o jogador já enviou a pontuação desta sessão pro
/// Placar (`SurveyScreen`).
 bool get hasSubmittedToLeaderboard;/// Idade/"já programou antes?" respondidas na Pesquisa — guardadas aqui
/// (não só usadas na hora) pra `LeaderboardSyncService` poder reenviar a
/// entrada do Placar sozinho a cada vitória nova, sem pedir de novo.
 int? get surveyAge; bool? get surveyHasProgrammedBefore;/// `true` depois que o jogador completa 100% das fases dos 7 Mundos
/// (`isGameCompleted`) — usado pra tirá-lo do Placar Geral e colocá-lo na
/// lista separada de quem zerou o jogo (`LeaderboardEntry.gameCompleted`,
/// ver `.claude/memory/decisions.md`).
 bool get gameCompleted;/// Quando `gameCompleted` virou `true` pela 1ª vez — guardado (não
/// recalculado a cada sincronização) pra lista de quem zerou poder
/// ordenar por quem terminou primeiro.
 DateTime? get gameCompletedAt;/// Nome de exibição escolhido pelo jogador em `ProfileEditView` — `null`
/// enquanto ele não editou nada, caso em que o Placar Geral/UI usam o
/// nome da conta (`AuthService.displayName`) como antes.
 String? get username;/// Id de `CharacterAvatar` (`lib/models/character_avatar.dart`) escolhido
/// em `ProfileEditView` — `null` enquanto ele não editou nada. Ver
/// `displayAvatarId` abaixo.
 String? get avatarId;/// `true` depois que o jogador já viu as boas-vindas (`WelcomeView`) —
/// atrelado à conta/UID e sincronizado no Firestore (`players/{uid}`),
/// fonte durável por conta que complementa o `shared_preferences` local
/// (`OnboardingState.seenWelcome`). Resiste à volatilidade do storage
/// local na web: mesclado por OR em `mergedWith`, nunca regride
/// `true → false` (ver bugfix `boas-vindas-primeira-vez`, issue #3).
 bool get seenWelcome;
/// Create a copy of ProgressState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgressStateCopyWith<ProgressState> get copyWith => _$ProgressStateCopyWithImpl<ProgressState>(this as ProgressState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressState&&const DeepCollectionEquality().equals(other.byLevelId, byLevelId)&&(identical(other.sessionScore, sessionScore) || other.sessionScore == sessionScore)&&(identical(other.hasSubmittedToLeaderboard, hasSubmittedToLeaderboard) || other.hasSubmittedToLeaderboard == hasSubmittedToLeaderboard)&&(identical(other.surveyAge, surveyAge) || other.surveyAge == surveyAge)&&(identical(other.surveyHasProgrammedBefore, surveyHasProgrammedBefore) || other.surveyHasProgrammedBefore == surveyHasProgrammedBefore)&&(identical(other.gameCompleted, gameCompleted) || other.gameCompleted == gameCompleted)&&(identical(other.gameCompletedAt, gameCompletedAt) || other.gameCompletedAt == gameCompletedAt)&&(identical(other.username, username) || other.username == username)&&(identical(other.avatarId, avatarId) || other.avatarId == avatarId)&&(identical(other.seenWelcome, seenWelcome) || other.seenWelcome == seenWelcome));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(byLevelId),sessionScore,hasSubmittedToLeaderboard,surveyAge,surveyHasProgrammedBefore,gameCompleted,gameCompletedAt,username,avatarId,seenWelcome);

@override
String toString() {
  return 'ProgressState(byLevelId: $byLevelId, sessionScore: $sessionScore, hasSubmittedToLeaderboard: $hasSubmittedToLeaderboard, surveyAge: $surveyAge, surveyHasProgrammedBefore: $surveyHasProgrammedBefore, gameCompleted: $gameCompleted, gameCompletedAt: $gameCompletedAt, username: $username, avatarId: $avatarId, seenWelcome: $seenWelcome)';
}


}

/// @nodoc
abstract mixin class $ProgressStateCopyWith<$Res>  {
  factory $ProgressStateCopyWith(ProgressState value, $Res Function(ProgressState) _then) = _$ProgressStateCopyWithImpl;
@useResult
$Res call({
 Map<String, LevelProgress> byLevelId, int sessionScore, bool hasSubmittedToLeaderboard, int? surveyAge, bool? surveyHasProgrammedBefore, bool gameCompleted, DateTime? gameCompletedAt, String? username, String? avatarId, bool seenWelcome
});




}
/// @nodoc
class _$ProgressStateCopyWithImpl<$Res>
    implements $ProgressStateCopyWith<$Res> {
  _$ProgressStateCopyWithImpl(this._self, this._then);

  final ProgressState _self;
  final $Res Function(ProgressState) _then;

/// Create a copy of ProgressState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? byLevelId = null,Object? sessionScore = null,Object? hasSubmittedToLeaderboard = null,Object? surveyAge = freezed,Object? surveyHasProgrammedBefore = freezed,Object? gameCompleted = null,Object? gameCompletedAt = freezed,Object? username = freezed,Object? avatarId = freezed,Object? seenWelcome = null,}) {
  return _then(_self.copyWith(
byLevelId: null == byLevelId ? _self.byLevelId : byLevelId // ignore: cast_nullable_to_non_nullable
as Map<String, LevelProgress>,sessionScore: null == sessionScore ? _self.sessionScore : sessionScore // ignore: cast_nullable_to_non_nullable
as int,hasSubmittedToLeaderboard: null == hasSubmittedToLeaderboard ? _self.hasSubmittedToLeaderboard : hasSubmittedToLeaderboard // ignore: cast_nullable_to_non_nullable
as bool,surveyAge: freezed == surveyAge ? _self.surveyAge : surveyAge // ignore: cast_nullable_to_non_nullable
as int?,surveyHasProgrammedBefore: freezed == surveyHasProgrammedBefore ? _self.surveyHasProgrammedBefore : surveyHasProgrammedBefore // ignore: cast_nullable_to_non_nullable
as bool?,gameCompleted: null == gameCompleted ? _self.gameCompleted : gameCompleted // ignore: cast_nullable_to_non_nullable
as bool,gameCompletedAt: freezed == gameCompletedAt ? _self.gameCompletedAt : gameCompletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,avatarId: freezed == avatarId ? _self.avatarId : avatarId // ignore: cast_nullable_to_non_nullable
as String?,seenWelcome: null == seenWelcome ? _self.seenWelcome : seenWelcome // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ProgressState].
extension ProgressStatePatterns on ProgressState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgressState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgressState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgressState value)  $default,){
final _that = this;
switch (_that) {
case _ProgressState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgressState value)?  $default,){
final _that = this;
switch (_that) {
case _ProgressState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, LevelProgress> byLevelId,  int sessionScore,  bool hasSubmittedToLeaderboard,  int? surveyAge,  bool? surveyHasProgrammedBefore,  bool gameCompleted,  DateTime? gameCompletedAt,  String? username,  String? avatarId,  bool seenWelcome)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgressState() when $default != null:
return $default(_that.byLevelId,_that.sessionScore,_that.hasSubmittedToLeaderboard,_that.surveyAge,_that.surveyHasProgrammedBefore,_that.gameCompleted,_that.gameCompletedAt,_that.username,_that.avatarId,_that.seenWelcome);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, LevelProgress> byLevelId,  int sessionScore,  bool hasSubmittedToLeaderboard,  int? surveyAge,  bool? surveyHasProgrammedBefore,  bool gameCompleted,  DateTime? gameCompletedAt,  String? username,  String? avatarId,  bool seenWelcome)  $default,) {final _that = this;
switch (_that) {
case _ProgressState():
return $default(_that.byLevelId,_that.sessionScore,_that.hasSubmittedToLeaderboard,_that.surveyAge,_that.surveyHasProgrammedBefore,_that.gameCompleted,_that.gameCompletedAt,_that.username,_that.avatarId,_that.seenWelcome);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, LevelProgress> byLevelId,  int sessionScore,  bool hasSubmittedToLeaderboard,  int? surveyAge,  bool? surveyHasProgrammedBefore,  bool gameCompleted,  DateTime? gameCompletedAt,  String? username,  String? avatarId,  bool seenWelcome)?  $default,) {final _that = this;
switch (_that) {
case _ProgressState() when $default != null:
return $default(_that.byLevelId,_that.sessionScore,_that.hasSubmittedToLeaderboard,_that.surveyAge,_that.surveyHasProgrammedBefore,_that.gameCompleted,_that.gameCompletedAt,_that.username,_that.avatarId,_that.seenWelcome);case _:
  return null;

}
}

}

/// @nodoc


class _ProgressState extends ProgressState {
  const _ProgressState({final  Map<String, LevelProgress> byLevelId = const {}, this.sessionScore = 0, this.hasSubmittedToLeaderboard = false, this.surveyAge, this.surveyHasProgrammedBefore, this.gameCompleted = false, this.gameCompletedAt, this.username, this.avatarId, this.seenWelcome = false}): _byLevelId = byLevelId,super._();
  

 final  Map<String, LevelProgress> _byLevelId;
@override@JsonKey() Map<String, LevelProgress> get byLevelId {
  if (_byLevelId is EqualUnmodifiableMapView) return _byLevelId;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_byLevelId);
}

/// Pontuação acumulada nesta sessão para o Placar do Dia — separada do
/// "PONTOS" por fase (`LevelProgress` não guarda isso).
@override@JsonKey() final  int sessionScore;
/// `true` depois que o jogador já enviou a pontuação desta sessão pro
/// Placar (`SurveyScreen`).
@override@JsonKey() final  bool hasSubmittedToLeaderboard;
/// Idade/"já programou antes?" respondidas na Pesquisa — guardadas aqui
/// (não só usadas na hora) pra `LeaderboardSyncService` poder reenviar a
/// entrada do Placar sozinho a cada vitória nova, sem pedir de novo.
@override final  int? surveyAge;
@override final  bool? surveyHasProgrammedBefore;
/// `true` depois que o jogador completa 100% das fases dos 7 Mundos
/// (`isGameCompleted`) — usado pra tirá-lo do Placar Geral e colocá-lo na
/// lista separada de quem zerou o jogo (`LeaderboardEntry.gameCompleted`,
/// ver `.claude/memory/decisions.md`).
@override@JsonKey() final  bool gameCompleted;
/// Quando `gameCompleted` virou `true` pela 1ª vez — guardado (não
/// recalculado a cada sincronização) pra lista de quem zerou poder
/// ordenar por quem terminou primeiro.
@override final  DateTime? gameCompletedAt;
/// Nome de exibição escolhido pelo jogador em `ProfileEditView` — `null`
/// enquanto ele não editou nada, caso em que o Placar Geral/UI usam o
/// nome da conta (`AuthService.displayName`) como antes.
@override final  String? username;
/// Id de `CharacterAvatar` (`lib/models/character_avatar.dart`) escolhido
/// em `ProfileEditView` — `null` enquanto ele não editou nada. Ver
/// `displayAvatarId` abaixo.
@override final  String? avatarId;
/// `true` depois que o jogador já viu as boas-vindas (`WelcomeView`) —
/// atrelado à conta/UID e sincronizado no Firestore (`players/{uid}`),
/// fonte durável por conta que complementa o `shared_preferences` local
/// (`OnboardingState.seenWelcome`). Resiste à volatilidade do storage
/// local na web: mesclado por OR em `mergedWith`, nunca regride
/// `true → false` (ver bugfix `boas-vindas-primeira-vez`, issue #3).
@override@JsonKey() final  bool seenWelcome;

/// Create a copy of ProgressState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgressStateCopyWith<_ProgressState> get copyWith => __$ProgressStateCopyWithImpl<_ProgressState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgressState&&const DeepCollectionEquality().equals(other._byLevelId, _byLevelId)&&(identical(other.sessionScore, sessionScore) || other.sessionScore == sessionScore)&&(identical(other.hasSubmittedToLeaderboard, hasSubmittedToLeaderboard) || other.hasSubmittedToLeaderboard == hasSubmittedToLeaderboard)&&(identical(other.surveyAge, surveyAge) || other.surveyAge == surveyAge)&&(identical(other.surveyHasProgrammedBefore, surveyHasProgrammedBefore) || other.surveyHasProgrammedBefore == surveyHasProgrammedBefore)&&(identical(other.gameCompleted, gameCompleted) || other.gameCompleted == gameCompleted)&&(identical(other.gameCompletedAt, gameCompletedAt) || other.gameCompletedAt == gameCompletedAt)&&(identical(other.username, username) || other.username == username)&&(identical(other.avatarId, avatarId) || other.avatarId == avatarId)&&(identical(other.seenWelcome, seenWelcome) || other.seenWelcome == seenWelcome));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_byLevelId),sessionScore,hasSubmittedToLeaderboard,surveyAge,surveyHasProgrammedBefore,gameCompleted,gameCompletedAt,username,avatarId,seenWelcome);

@override
String toString() {
  return 'ProgressState(byLevelId: $byLevelId, sessionScore: $sessionScore, hasSubmittedToLeaderboard: $hasSubmittedToLeaderboard, surveyAge: $surveyAge, surveyHasProgrammedBefore: $surveyHasProgrammedBefore, gameCompleted: $gameCompleted, gameCompletedAt: $gameCompletedAt, username: $username, avatarId: $avatarId, seenWelcome: $seenWelcome)';
}


}

/// @nodoc
abstract mixin class _$ProgressStateCopyWith<$Res> implements $ProgressStateCopyWith<$Res> {
  factory _$ProgressStateCopyWith(_ProgressState value, $Res Function(_ProgressState) _then) = __$ProgressStateCopyWithImpl;
@override @useResult
$Res call({
 Map<String, LevelProgress> byLevelId, int sessionScore, bool hasSubmittedToLeaderboard, int? surveyAge, bool? surveyHasProgrammedBefore, bool gameCompleted, DateTime? gameCompletedAt, String? username, String? avatarId, bool seenWelcome
});




}
/// @nodoc
class __$ProgressStateCopyWithImpl<$Res>
    implements _$ProgressStateCopyWith<$Res> {
  __$ProgressStateCopyWithImpl(this._self, this._then);

  final _ProgressState _self;
  final $Res Function(_ProgressState) _then;

/// Create a copy of ProgressState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? byLevelId = null,Object? sessionScore = null,Object? hasSubmittedToLeaderboard = null,Object? surveyAge = freezed,Object? surveyHasProgrammedBefore = freezed,Object? gameCompleted = null,Object? gameCompletedAt = freezed,Object? username = freezed,Object? avatarId = freezed,Object? seenWelcome = null,}) {
  return _then(_ProgressState(
byLevelId: null == byLevelId ? _self._byLevelId : byLevelId // ignore: cast_nullable_to_non_nullable
as Map<String, LevelProgress>,sessionScore: null == sessionScore ? _self.sessionScore : sessionScore // ignore: cast_nullable_to_non_nullable
as int,hasSubmittedToLeaderboard: null == hasSubmittedToLeaderboard ? _self.hasSubmittedToLeaderboard : hasSubmittedToLeaderboard // ignore: cast_nullable_to_non_nullable
as bool,surveyAge: freezed == surveyAge ? _self.surveyAge : surveyAge // ignore: cast_nullable_to_non_nullable
as int?,surveyHasProgrammedBefore: freezed == surveyHasProgrammedBefore ? _self.surveyHasProgrammedBefore : surveyHasProgrammedBefore // ignore: cast_nullable_to_non_nullable
as bool?,gameCompleted: null == gameCompleted ? _self.gameCompleted : gameCompleted // ignore: cast_nullable_to_non_nullable
as bool,gameCompletedAt: freezed == gameCompletedAt ? _self.gameCompletedAt : gameCompletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,avatarId: freezed == avatarId ? _self.avatarId : avatarId // ignore: cast_nullable_to_non_nullable
as String?,seenWelcome: null == seenWelcome ? _self.seenWelcome : seenWelcome // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
