import 'package:color_tile/provider/block_provider.dart';
import 'package:color_tile/provider/score_provider.dart';
import 'package:color_tile/provider/time_provider.dart';
import 'package:color_tile/screen/sign_in_page.dart';
import 'package:color_tile/screen/sign_out_page.dart';
import 'package:color_tile/screen/sign_up_page.dart';
import 'package:color_tile/screen/playing_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('Current User: ');
    print(FirebaseAuth.instance.currentUser?.email);
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
                    builder: (context) => const SignUpPage(),
                  ),
                );
              },
              child: const Text('sign up'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SignInPage(),
                  ),
                );
              },
              child: const Text('sign in'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SignOutPage(),
                  ),
                );
              },
              child: const Text('sign out'),
            ),
          ],
        ),
      ),
    );
  }
}
