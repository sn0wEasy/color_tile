// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'block.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BlockModel {
  double get initialX => throw _privateConstructorUsedError;
  double get initialY => throw _privateConstructorUsedError;
  double get finalX => throw _privateConstructorUsedError;
  double get finalY => throw _privateConstructorUsedError;
  Color get color => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BlockModelCopyWith<BlockModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockModelCopyWith<$Res> {
  factory $BlockModelCopyWith(
          BlockModel value, $Res Function(BlockModel) then) =
      _$BlockModelCopyWithImpl<$Res, BlockModel>;
  @useResult
  $Res call(
      {double initialX,
      double initialY,
      double finalX,
      double finalY,
      Color color,
      int index});
}

/// @nodoc
class _$BlockModelCopyWithImpl<$Res, $Val extends BlockModel>
    implements $BlockModelCopyWith<$Res> {
  _$BlockModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialX = null,
    Object? initialY = null,
    Object? finalX = null,
    Object? finalY = null,
    Object? color = null,
    Object? index = null,
  }) {
    return _then(_value.copyWith(
      initialX: null == initialX
          ? _value.initialX
          : initialX // ignore: cast_nullable_to_non_nullable
              as double,
      initialY: null == initialY
          ? _value.initialY
          : initialY // ignore: cast_nullable_to_non_nullable
              as double,
      finalX: null == finalX
          ? _value.finalX
          : finalX // ignore: cast_nullable_to_non_nullable
              as double,
      finalY: null == finalY
          ? _value.finalY
          : finalY // ignore: cast_nullable_to_non_nullable
              as double,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BlockModelCopyWith<$Res>
    implements $BlockModelCopyWith<$Res> {
  factory _$$_BlockModelCopyWith(
          _$_BlockModel value, $Res Function(_$_BlockModel) then) =
      __$$_BlockModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double initialX,
      double initialY,
      double finalX,
      double finalY,
      Color color,
      int index});
}

/// @nodoc
class __$$_BlockModelCopyWithImpl<$Res>
    extends _$BlockModelCopyWithImpl<$Res, _$_BlockModel>
    implements _$$_BlockModelCopyWith<$Res> {
  __$$_BlockModelCopyWithImpl(
      _$_BlockModel _value, $Res Function(_$_BlockModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialX = null,
    Object? initialY = null,
    Object? finalX = null,
    Object? finalY = null,
    Object? color = null,
    Object? index = null,
  }) {
    return _then(_$_BlockModel(
      initialX: null == initialX
          ? _value.initialX
          : initialX // ignore: cast_nullable_to_non_nullable
              as double,
      initialY: null == initialY
          ? _value.initialY
          : initialY // ignore: cast_nullable_to_non_nullable
              as double,
      finalX: null == finalX
          ? _value.finalX
          : finalX // ignore: cast_nullable_to_non_nullable
              as double,
      finalY: null == finalY
          ? _value.finalY
          : finalY // ignore: cast_nullable_to_non_nullable
              as double,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_BlockModel implements _BlockModel {
  const _$_BlockModel(
      {required this.initialX,
      required this.initialY,
      required this.finalX,
      required this.finalY,
      required this.color,
      required this.index});

  @override
  final double initialX;
  @override
  final double initialY;
  @override
  final double finalX;
  @override
  final double finalY;
  @override
  final Color color;
  @override
  final int index;

  @override
  String toString() {
    return 'BlockModel(initialX: $initialX, initialY: $initialY, finalX: $finalX, finalY: $finalY, color: $color, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BlockModel &&
            (identical(other.initialX, initialX) ||
                other.initialX == initialX) &&
            (identical(other.initialY, initialY) ||
                other.initialY == initialY) &&
            (identical(other.finalX, finalX) || other.finalX == finalX) &&
            (identical(other.finalY, finalY) || other.finalY == finalY) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, initialX, initialY, finalX, finalY, color, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BlockModelCopyWith<_$_BlockModel> get copyWith =>
      __$$_BlockModelCopyWithImpl<_$_BlockModel>(this, _$identity);
}

abstract class _BlockModel implements BlockModel {
  const factory _BlockModel(
      {required final double initialX,
      required final double initialY,
      required final double finalX,
      required final double finalY,
      required final Color color,
      required final int index}) = _$_BlockModel;

  @override
  double get initialX;
  @override
  double get initialY;
  @override
  double get finalX;
  @override
  double get finalY;
  @override
  Color get color;
  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$_BlockModelCopyWith<_$_BlockModel> get copyWith =>
      throw _privateConstructorUsedError;
}
