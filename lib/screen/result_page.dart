import 'package:color_tile/controllers/block_provider.dart';
import 'package:color_tile/controllers/time_provider.dart';
import 'package:color_tile/screen/playing_page.dart';
import 'package:color_tile/screen/title_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:color_tile/controllers/score_provider.dart';

class ResultPage extends ConsumerWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final time = ref.watch(displayDiscreteTimeProvider);
    final accuracy = ref.watch(displayDistanceScoreProvider);
    final totalScore = ref.watch(totalScoreProvider);
    final totalScoreDiff = ref.watch(scoreDiffProvider);

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
              'Time: $time',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            Text(
              'Accuracy: $accuracy',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            TotalScoreResultComponents(
              totalScore: totalScore,
              scoreDiff: totalScoreDiff,
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

class TotalScoreResultComponents extends StatelessWidget {
  const TotalScoreResultComponents({
    Key? key,
    required this.totalScore,
    required this.scoreDiff,
  }) : super(key: key);

  final int totalScore;
  final int scoreDiff;

  @override
  Widget build(BuildContext context) {
    if (scoreDiff > 0) {
      return Column(
        children: [
          Text('New Record!!', style: TextStyle(color: Colors.red)),
          SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total Score: $totalScore',
                style: const TextStyle(fontSize: 20),
              ),
              SizedBox(width: 5.0),
              Text(
                '+$scoreDiff',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ],
      );
    } else {
      return Text(
        'Total Score: $totalScore',
        style: const TextStyle(fontSize: 20),
      );
    }
  }
}
