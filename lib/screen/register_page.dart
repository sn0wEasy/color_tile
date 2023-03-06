import 'package:color_tile/controllers/user_provider.dart';
import 'package:color_tile/screen/title_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegisterPage extends HookConsumerWidget {
  RegisterPage({super.key});

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('ユーザ名を入力してください'),

          /// ユーザ名入力
          TextField(
            decoration: const InputDecoration(
              label: Text('Guest'),
            ),
            controller: controller,
          ),
          SizedBox(height: 8),

          /// 送信
          ElevatedButton(
            onPressed: () {
              ref.read(userServiceProvider.notifier).state = controller.text;
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MyHomePage(),
                ),
              );
            },
            child: Text('push'),
          ),
          SizedBox(height: 8),

          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('back'),
          ),
        ],
      ),
    );
  }
}
