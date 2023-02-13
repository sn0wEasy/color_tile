import 'package:color_tile/component/constant_block.dart';
import 'package:color_tile/component/movable_block.dart';
import 'package:color_tile/constants.dart';
import 'package:color_tile/provider/elapsedtime_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiver/iterables.dart';
import 'package:go_router/go_router.dart';
import 'package:color_tile/model/block_model.dart';
import 'package:color_tile/provider/block_provider.dart';

class PlayingPage extends HookConsumerWidget {
  PlayingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<BlockModel> initialBlockProfile = ref.watch(blockModelProvider);
    return Scaffold(
      body: Center(
        child: OverflowBox(
          minWidth: 0.0,
          minHeight: 0.0,
          maxWidth: double.infinity,
          maxHeight: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: kContainerWidth,
                height: kContainerHeight,
                color: Colors.transparent,
                child: Stack(
                  children: [
                    ...[
                      for (num i in range(kConstantBlockProfile.length))
                        ConstantBlock(
                          kConstantBlockProfile[i.toInt()]['initialX'],
                          kConstantBlockProfile[i.toInt()]['initialY'],
                          kConstantBlockProfile[i.toInt()]['blockColor'],
                          i.toInt(),
                        )
                    ],
                    ...[
                      for (num i in range(initialBlockProfile.length))
                        MovableBlock(
                          initialBlockProfile[i.toInt()].finalX,
                          initialBlockProfile[i.toInt()].finalY,
                          initialBlockProfile[i.toInt()].color,
                          i.toInt(),
                        )
                    ],
                  ],
                ),
              ),
              Text(
                '${ref.watch(displayTimeProvider)}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 30),
              TextButton(
                onPressed: () {
                  ref.read(stopwatchProvider.notifier).stop();
                  return context.go('/result');
                },
                child: const Text('submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
