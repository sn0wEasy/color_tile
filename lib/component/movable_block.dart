import 'package:color_tile/component/positioned_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MovableBlock extends HookWidget {
  const MovableBlock(this.x, this.y, this.colour, {super.key});
  final double x;
  final double y;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    final currentX = useState(x);
    final currentY = useState(y);

    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      onPanUpdate: (details) {
        currentX.value += details.delta.dx;
        currentY.value += details.delta.dy;
        // print('${currentX.value}, ${currentY.value}');
      },
      onPanEnd: (details) {
        // CoordinateModelを更新する
        print('end');
      },
      child: PositionedBlock(
        x: currentX.value,
        y: currentY.value,
        colour: colour,
      ),
    );
  }
}
