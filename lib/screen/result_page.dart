import 'package:color_tile/provider/block_provider.dart';
import 'package:color_tile/provider/time_provider.dart';
import 'package:color_tile/screen/playing_page.dart';
import 'package:color_tile/screen/title_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:color_tile/provider/score_provider.dart';

class ResultPage extends ConsumerWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Result',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Time: ${ref.watch(displayDiscreteTimeProvider)}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            Text(
              'Accuracy: ${ref.watch(displayDistanceScoreProvider)}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total Score: ${ref.watch(totalScoreProvider)}',
                  style: const TextStyle(fontSize: 20),
                ),
                DisplayScoreDiff(),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                ref.read(blockModelProvider.notifier).initCoordinate();
                ref.read(stopwatchContinuousProvider.notifier).reset();
                ref.read(stopwatchContinuousProvider.notifier).start();
                ref.read(oldHighScoreProvider.notifier).updateHighScore();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PlayingPage(),
                  ),
                );
              },
              child: const Text('Continue'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ref.read(blockModelProvider.notifier).initCoordinate();
                ref.read(stopwatchContinuousProvider.notifier).reset();
                ref.read(oldHighScoreProvider.notifier).updateHighScore();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage(),
                  ),
                );
              },
              child: const Text('Back to Title'),
            ),
          ],
        ),
      ),
    );
  }
}

class DisplayScoreDiff extends ConsumerWidget {
  const DisplayScoreDiff({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scoreDiff = ref.watch(scoreDiffProvider);
    if (scoreDiff > 0) {
      return Text('+$scoreDiff');
    } else {
      return Container();
    }
  }
}
