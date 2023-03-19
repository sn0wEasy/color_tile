import 'package:color_tile/controllers/auth_controller.dart';
import 'package:color_tile/controllers/block_provider.dart';
import 'package:color_tile/controllers/device_id_provider.dart';
import 'package:color_tile/controllers/score_provider.dart';
import 'package:color_tile/controllers/time_provider.dart';
import 'package:color_tile/controllers/user_profile_controller.dart';
import 'package:color_tile/screen/register_page.dart';
import 'package:color_tile/screen/playing_page.dart';
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
      ref.read(authControllerProvider.notifier).appStarted();
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(displayNameProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'High Score: ${ref.watch(highScoreProvider)}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 50),
            const Text(
              'ARtile',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            const SizedBox(height: 30),
            Text('現在のユーザ：$currentUser'),
            const SizedBox(height: 20),
            ElevatedButton(
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
              child: const Text('start'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                ref.read(userProfileNotifierProvider.notifier).init();

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RegisterPage(),
                  ),
                );
              },
              child: const Text('register'),
            ),
          ],
        ),
      ),
    );
  }
}
