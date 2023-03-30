import 'package:color_tile/component/constant_block.dart';
import 'package:color_tile/component/movable_block.dart';
import 'package:color_tile/constants.dart';
import 'package:color_tile/controllers/score_provider.dart';
import 'package:color_tile/controllers/time_provider.dart';
import 'package:color_tile/controllers/user_profile_controller.dart';
import 'package:color_tile/screen/result_page.dart';
import 'package:color_tile/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiver/iterables.dart';
import 'package:color_tile/controllers/block.dart';
import 'package:color_tile/controllers/block_provider.dart';

class PlayingPage extends HookConsumerWidget {
  const PlayingPage({super.key});

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
                ref.watch(displayContinuousTimeProvider),
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 30),
              CustomElevatedButton(
                onPressed: () async {
                  ref.read(stopwatchContinuousProvider.notifier).stop();
                  ref.read(stopwatchDiscreteProvider.notifier).push();
                  ref.read(displayDistanceScoreProvider.notifier).push();
                  ref.read(highScoreProvider.notifier).updateHighScore();

                  /// ハイスコアをDBに送信する
                  if (await ref.watch(scoreDiffProvider.future) > 0) {
                    ref
                        .read(userProfileNotifierProvider.notifier)
                        .updateBestRecord();
                  }

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ResultPage(),
                    ),
                  );
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
