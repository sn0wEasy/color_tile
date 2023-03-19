// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
mixin _$UserProfile {
  String? get displayName => throw _privateConstructorUsedError;
  String? get platform => throw _privateConstructorUsedError;
  Record? get bestRecord => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) then) =
      _$UserProfileCopyWithImpl<$Res, UserProfile>;
  @useResult
  $Res call({String? displayName, String? platform, Record? bestRecord});

  $RecordCopyWith<$Res>? get bestRecord;
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res, $Val extends UserProfile>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = freezed,
    Object? platform = freezed,
    Object? bestRecord = freezed,
  }) {
    return _then(_value.copyWith(
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      platform: freezed == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String?,
      bestRecord: freezed == bestRecord
          ? _value.bestRecord
          : bestRecord // ignore: cast_nullable_to_non_nullable
              as Record?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RecordCopyWith<$Res>? get bestRecord {
    if (_value.bestRecord == null) {
      return null;
    }

    return $RecordCopyWith<$Res>(_value.bestRecord!, (value) {
      return _then(_value.copyWith(bestRecord: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserProfileCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$$_UserProfileCopyWith(
          _$_UserProfile value, $Res Function(_$_UserProfile) then) =
      __$$_UserProfileCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? displayName, String? platform, Record? bestRecord});

  @override
  $RecordCopyWith<$Res>? get bestRecord;
}

/// @nodoc
class __$$_UserProfileCopyWithImpl<$Res>
    extends _$UserProfileCopyWithImpl<$Res, _$_UserProfile>
    implements _$$_UserProfileCopyWith<$Res> {
  __$$_UserProfileCopyWithImpl(
      _$_UserProfile _value, $Res Function(_$_UserProfile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = freezed,
    Object? platform = freezed,
    Object? bestRecord = freezed,
  }) {
    return _then(_$_UserProfile(
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      platform: freezed == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String?,
      bestRecord: freezed == bestRecord
          ? _value.bestRecord
          : bestRecord // ignore: cast_nullable_to_non_nullable
              as Record?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserProfile implements _UserProfile {
  const _$_UserProfile({this.displayName, this.platform, this.bestRecord});

  factory _$_UserProfile.fromJson(Map<String, dynamic> json) =>
      _$$_UserProfileFromJson(json);

  @override
  final String? displayName;
  @override
  final String? platform;
  @override
  final Record? bestRecord;

  @override
  String toString() {
    return 'UserProfile(displayName: $displayName, platform: $platform, bestRecord: $bestRecord)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserProfile &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.bestRecord, bestRecord) ||
                other.bestRecord == bestRecord));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, displayName, platform, bestRecord);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserProfileCopyWith<_$_UserProfile> get copyWith =>
      __$$_UserProfileCopyWithImpl<_$_UserProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserProfileToJson(
      this,
    );
  }
}

abstract class _UserProfile implements UserProfile {
  const factory _UserProfile(
      {final String? displayName,
      final String? platform,
      final Record? bestRecord}) = _$_UserProfile;

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$_UserProfile.fromJson;

  @override
  String? get displayName;
  @override
  String? get platform;
  @override
  Record? get bestRecord;
  @override
  @JsonKey(ignore: true)
  _$$_UserProfileCopyWith<_$_UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}
