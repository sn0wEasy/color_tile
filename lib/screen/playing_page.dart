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
import 'dart:async';

class PlayingPage extends HookConsumerWidget {
  PlayingPage({super.key});
  final Stopwatch timer = Stopwatch();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayedTime = useState('00:00.00');

    void keepRunning() {
      if (timer.isRunning) {
        Timer(Duration(milliseconds: 1), keepRunning);
      }
      int milliSeconds = ((timer.elapsedMilliseconds / 10).floor() % 100);
      displayedTime.value =
          (timer.elapsed.inMinutes % 60).toString().padLeft(2, '0') +
              ':' +
              (timer.elapsed.inSeconds % 60).toString().padLeft(2, '0') +
              ':' +
              (milliSeconds).toString().padLeft(2, '0');
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      timer.start();
      keepRunning();
    });
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
                '${displayedTime.value}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 30),
              TextButton(
                onPressed: () {
                  timer.stop();
                  ref.read(elapsedTimeProvider.notifier).state =
                      timer.elapsedMilliseconds;
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
