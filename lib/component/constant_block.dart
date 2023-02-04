import 'package:color_tile/component/positioned_block.dart';
import 'package:flutter/material.dart';

class ConstantBlock extends StatelessWidget {
  const ConstantBlock(this.x, this.y, this.colour, {super.key});
  final double x;
  final double y;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return PositionedBlock(x: x, y: y, colour: colour);
  }
}
