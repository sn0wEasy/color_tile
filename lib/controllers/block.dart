import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'block.freezed.dart';

@freezed
class BlockModel with _$BlockModel {
  const factory BlockModel({
    required double initialX,
    required double initialY,
    required double finalX,
    required double finalY,
    required Color color,
    required int index,
  }) = _BlockModel;
}
