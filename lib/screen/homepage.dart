import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ARtile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'ARtile',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => context.go('/playing'),
              child: const Text('start'),
            ),
          ],
        ),
      ),
    );
  }
}
