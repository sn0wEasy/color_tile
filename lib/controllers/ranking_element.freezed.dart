// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ranking_element.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RankingElement _$RankingElementFromJson(Map<String, dynamic> json) {
  return _RankingElement.fromJson(json);
}

/// @nodoc
mixin _$RankingElement {
  String get deviceId => throw _privateConstructorUsedError;
  String get platform => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  int get totalScore => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RankingElementCopyWith<RankingElement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RankingElementCopyWith<$Res> {
  factory $RankingElementCopyWith(
          RankingElement value, $Res Function(RankingElement) then) =
      _$RankingElementCopyWithImpl<$Res, RankingElement>;
  @useResult
  $Res call(
      {String deviceId, String platform, String displayName, int totalScore});
}

/// @nodoc
class _$RankingElementCopyWithImpl<$Res, $Val extends RankingElement>
    implements $RankingElementCopyWith<$Res> {
  _$RankingElementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? platform = null,
    Object? displayName = null,
    Object? totalScore = null,
  }) {
    return _then(_value.copyWith(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      totalScore: null == totalScore
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RankingElementCopyWith<$Res>
    implements $RankingElementCopyWith<$Res> {
  factory _$$_RankingElementCopyWith(
          _$_RankingElement value, $Res Function(_$_RankingElement) then) =
      __$$_RankingElementCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String deviceId, String platform, String displayName, int totalScore});
}

/// @nodoc
class __$$_RankingElementCopyWithImpl<$Res>
    extends _$RankingElementCopyWithImpl<$Res, _$_RankingElement>
    implements _$$_RankingElementCopyWith<$Res> {
  __$$_RankingElementCopyWithImpl(
      _$_RankingElement _value, $Res Function(_$_RankingElement) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? platform = null,
    Object? displayName = null,
    Object? totalScore = null,
  }) {
    return _then(_$_RankingElement(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      totalScore: null == totalScore
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RankingElement implements _RankingElement {
  const _$_RankingElement(
      {required this.deviceId,
      required this.platform,
      required this.displayName,
      required this.totalScore});

  factory _$_RankingElement.fromJson(Map<String, dynamic> json) =>
      _$$_RankingElementFromJson(json);

  @override
  final String deviceId;
  @override
  final String platform;
  @override
  final String displayName;
  @override
  final int totalScore;

  @override
  String toString() {
    return 'RankingElement(deviceId: $deviceId, platform: $platform, displayName: $displayName, totalScore: $totalScore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RankingElement &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.totalScore, totalScore) ||
                other.totalScore == totalScore));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, deviceId, platform, displayName, totalScore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RankingElementCopyWith<_$_RankingElement> get copyWith =>
      __$$_RankingElementCopyWithImpl<_$_RankingElement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RankingElementToJson(
      this,
    );
  }
}

abstract class _RankingElement implements RankingElement {
  const factory _RankingElement(
      {required final String deviceId,
      required final String platform,
      required final String displayName,
      required final int totalScore}) = _$_RankingElement;

  factory _RankingElement.fromJson(Map<String, dynamic> json) =
      _$_RankingElement.fromJson;

  @override
  String get deviceId;
  @override
  String get platform;
  @override
  String get displayName;
  @override
  int get totalScore;
  @override
  @JsonKey(ignore: true)
  _$$_RankingElementCopyWith<_$_RankingElement> get copyWith =>
      throw _privateConstructorUsedError;
}
