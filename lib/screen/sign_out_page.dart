import 'package:color_tile/screen/title_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignOutPage extends HookConsumerWidget {
  const SignOutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('サインアウトしますか？'),
            const SizedBox(height: 10),

            /// Yes
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage(),
                  ),
                );
              },
              child: Text('Yes'),
            ),
            const SizedBox(height: 10),

            /// No
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('No'),
            ),
          ],
        ),
      ),
    );
  }
}
