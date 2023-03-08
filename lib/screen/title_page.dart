import 'package:color_tile/controllers/block_provider.dart';
import 'package:color_tile/controllers/score_provider.dart';
import 'package:color_tile/controllers/time_provider.dart';
import 'package:color_tile/controllers/user_provider.dart';
import 'package:color_tile/screen/register_page.dart';
import 'package:color_tile/screen/playing_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // FIXME: 端末IDをキーとして、ユーザ名を取得
    final currentUser = ref.watch(userServiceProvider);

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
