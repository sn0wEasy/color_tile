import 'package:color_tile/provider/block_provider.dart';
import 'package:color_tile/provider/time_provider.dart';
import 'package:color_tile/screen/playing_page.dart';
import 'package:color_tile/screen/title_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
              // FIXME: タイマーがストップになった時だけ監視するようProviderを修正
              'Time: ${ref.watch(stopwatchProvider)}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            Text(
              'Distance Score: ${ref.watch(distanceScoreProvider)}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            Text(
              // FIXME: タイマーがストップになった時だけ監視するようProviderを修正
              'Total Score: ${ref.watch(totalScoreProvider)}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                ref.read(blockModelProvider.notifier).initCoordinate();
                ref.read(stopwatchProvider.notifier).reset();
                ref.read(stopwatchProvider.notifier).start();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PlayingPage(),
                  ),
                );
              },
              child: const Text('Continue'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ref.read(blockModelProvider.notifier).initCoordinate();
                ref.read(stopwatchProvider.notifier).reset();
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
