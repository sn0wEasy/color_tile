import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class BlockModel {
  const BlockModel({
    required this.initialX,
    required this.initialY,
    required this.finalX,
    required this.finalY,
    required this.color,
    required this.index,
  });

  final double initialX;
  final double initialY;
  final double finalX;
  final double finalY;
  final Color color;
  final int index;

  BlockModel copyWith({
    double? finalX,
    double? finalY,
  }) {
    return BlockModel(
      initialX: initialX,
      initialY: initialY,
      finalX: finalX ?? this.finalX,
      finalY: finalY ?? this.finalY,
      color: color,
      index: index,
    );
  }
}
