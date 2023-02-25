import 'package:color_tile/component/positioned_block.dart';
import 'package:color_tile/controllers/block_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MovableBlock extends HookConsumerWidget {
  const MovableBlock(this.initialX, this.initialY, this.colour, this.blockIndex,
      {super.key});

  final double initialX;
  final double initialY;
  final Color colour;
  final int blockIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentX = useState(initialX);
    final currentY = useState(initialY);

    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      onPanUpdate: (details) {
        currentX.value += details.delta.dx;
        currentY.value += details.delta.dy;
      },
      onPanEnd: (details) {
        // CoordinateModelの初期座標と最終座標を登録する
        ref.read(blockModelProvider.notifier).updateCoordinate(
              currentX.value,
              currentY.value,
              blockIndex,
            );
      },
      child: PositionedBlock(
        x: currentX.value,
        y: currentY.value,
        colour: colour,
      ),
    );
  }
}
