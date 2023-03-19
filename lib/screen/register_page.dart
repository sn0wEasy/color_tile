import 'package:color_tile/controllers/device_id_provider.dart';
import 'package:color_tile/controllers/user_profile_controller.dart';
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
            onPressed: () async {
              ref.read(displayNameProvider.notifier).state = controller.text;
              ref
                  .read(userProfileNotifierProvider.notifier)
                  .updateDisplayName();

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
