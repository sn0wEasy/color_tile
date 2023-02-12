import 'package:color_tile/component/constant_block.dart';
import 'package:color_tile/component/movable_block.dart';
import 'package:color_tile/constants.dart';
import 'package:color_tile/provider/elapsedtime_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:quiver/iterables.dart';
import 'package:go_router/go_router.dart';
import 'package:color_tile/provider/block_provider.dart';

class PlayingPage extends HookConsumerWidget {
  PlayingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    // FIXME: ランダム化した座標をproviderから取得する
                    ...[
                      for (num i in range(kMovableBlockProfile.length))
                        MovableBlock(
                          kMovableBlockProfile[i.toInt()]['initialX'],
                          kMovableBlockProfile[i.toInt()]['initialY'],
                          kMovableBlockProfile[i.toInt()]['blockColor'],
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
