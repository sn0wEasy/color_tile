// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Record _$RecordFromJson(Map<String, dynamic> json) {
  return _Record.fromJson(json);
}

/// @nodoc
mixin _$Record {
  String get time => throw _privateConstructorUsedError;
  int get accuracy => throw _privateConstructorUsedError;
  int get totalScore => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecordCopyWith<Record> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordCopyWith<$Res> {
  factory $RecordCopyWith(Record value, $Res Function(Record) then) =
      _$RecordCopyWithImpl<$Res, Record>;
  @useResult
  $Res call({String time, int accuracy, int totalScore});
}

/// @nodoc
class _$RecordCopyWithImpl<$Res, $Val extends Record>
    implements $RecordCopyWith<$Res> {
  _$RecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? accuracy = null,
    Object? totalScore = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as int,
      totalScore: null == totalScore
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecordCopyWith<$Res> implements $RecordCopyWith<$Res> {
  factory _$$_RecordCopyWith(_$_Record value, $Res Function(_$_Record) then) =
      __$$_RecordCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String time, int accuracy, int totalScore});
}

/// @nodoc
class __$$_RecordCopyWithImpl<$Res>
    extends _$RecordCopyWithImpl<$Res, _$_Record>
    implements _$$_RecordCopyWith<$Res> {
  __$$_RecordCopyWithImpl(_$_Record _value, $Res Function(_$_Record) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? accuracy = null,
    Object? totalScore = null,
  }) {
    return _then(_$_Record(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as int,
      totalScore: null == totalScore
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Record implements _Record {
  const _$_Record(
      {required this.time, required this.accuracy, required this.totalScore});

  factory _$_Record.fromJson(Map<String, dynamic> json) =>
      _$$_RecordFromJson(json);

  @override
  final String time;
  @override
  final int accuracy;
  @override
  final int totalScore;

  @override
  String toString() {
    return 'Record(time: $time, accuracy: $accuracy, totalScore: $totalScore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Record &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.totalScore, totalScore) ||
                other.totalScore == totalScore));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, time, accuracy, totalScore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecordCopyWith<_$_Record> get copyWith =>
      __$$_RecordCopyWithImpl<_$_Record>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecordToJson(
      this,
    );
  }
}

abstract class _Record implements Record {
  const factory _Record(
      {required final String time,
      required final int accuracy,
      required final int totalScore}) = _$_Record;

  factory _Record.fromJson(Map<String, dynamic> json) = _$_Record.fromJson;

  @override
  String get time;
  @override
  int get accuracy;
  @override
  int get totalScore;
  @override
  @JsonKey(ignore: true)
  _$$_RecordCopyWith<_$_Record> get copyWith =>
      throw _privateConstructorUsedError;
}
