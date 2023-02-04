import 'package:flutter/material.dart';
import 'package:color_tile/constants.dart';

class PositionedBlock extends StatelessWidget {
  const PositionedBlock({
    required this.x,
    required this.y,
    required this.colour,
    super.key,
  });
  final double x;
  final double y;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: x + kXConst,
          top: y + kYConst,
          width: kTileSize,
          height: kTileSize,
          child: Container(
            decoration: BoxDecoration(
              color: colour,
              borderRadius: BorderRadius.circular(kBorderRadius),
            ),
          ),
        ),
      ],
    );
  }
}
