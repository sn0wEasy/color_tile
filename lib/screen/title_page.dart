import 'package:color_tile/controllers/auth_controller.dart';
import 'package:color_tile/controllers/block_provider.dart';
import 'package:color_tile/controllers/ranking_controller.dart';
import 'package:color_tile/controllers/time_provider.dart';
import 'package:color_tile/controllers/user_profile_controller.dart';
import 'package:color_tile/repositories/user_profile_repository.dart';
import 'package:color_tile/screen/ranking_page.dart';
import 'package:color_tile/screen/register_page.dart';
import 'package:color_tile/screen/playing_page.dart';
import 'package:color_tile/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Future(() async {
      await ref.read(authControllerProvider.notifier).appStarted();
      await ref.read(userProfileNotifierProvider.notifier).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final highScore = ref.read(userProfileRepositoryProvider).highScore;
    final displayName = ref.read(userProfileRepositoryProvider).displayName;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<int>(
              future: highScore,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return const Text("none");
                  case ConnectionState.waiting:
                    return const Text("loading...");
                  case ConnectionState.active:
                    return const Text("active");
                  case ConnectionState.done:
                    return Text(
                      'ハイスコア: ${snapshot.data}',
                      style: const TextStyle(fontSize: 20),
                    );
                }
              },
            ),
            const SizedBox(height: 50),
            const Text(
              'ARtile',
              style: TextStyle(
                fontSize: 50,
              ),
            ),
            const SizedBox(height: 30),
            FutureBuilder<String>(
              future: displayName,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return const Text("none");
                  case ConnectionState.waiting:
                    return const Text("loading...");
                  case ConnectionState.active:
                    return const Text("active");
                  case ConnectionState.done:
                    return Text(
                      '表示名: ${snapshot.data}',
                      style: const TextStyle(fontSize: 20),
                    );
                }
              },
            ),
            const SizedBox(height: 20),
            CustomElevatedButton(
              onPressed: () {
                ref.read(userProfileNotifierProvider.notifier).init();
                ref.read(blockModelProvider.notifier).initCoordinate();
                ref.read(stopwatchContinuousProvider.notifier).reset();
                ref.read(stopwatchContinuousProvider.notifier).start();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PlayingPage(),
                  ),
                );
              },
              child: const Text('Play'),
            ),
            const SizedBox(height: 10),
            CustomElevatedButton(
              onPressed: () {
                ref.read(userProfileNotifierProvider.notifier).init();

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RegisterPage(),
                  ),
                );
              },
              child: const Text('Edit name'),
            ),
            const SizedBox(height: 10),
            CustomElevatedButton(
              onPressed: () async {
                await ref
                    .read(rankingNotifierProvider.notifier)
                    .updateBestRecordRanking();

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const RankingPage(),
                  ),
                );
              },
              child: const Text('Ranking'),
            ),
          ],
        ),
      ),
    );
  }
}
