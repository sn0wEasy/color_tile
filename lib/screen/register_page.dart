import 'package:color_tile/controllers/device_id_provider.dart';
import 'package:color_tile/controllers/user_profile_controller.dart';
import 'package:color_tile/screen/title_page.dart';
import 'package:color_tile/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RegisterPage extends HookConsumerWidget {
  RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final formValidator = useState(false);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('ユーザ名を入力してください'),
            SizedBox(height: 8),

            /// ユーザ名入力
            SizedBox(
              width: 400,
              child: TextFormField(
                maxLength: 20,
                onChanged: (value) {
                  formValidator.value = value.isNotEmpty;
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.send),
                  hintText: 'Your name',
                  counterText: '入力条件：1文字以上20文字以内',
                  border: OutlineInputBorder(),
                ),
                controller: controller,
              ),
            ),
            SizedBox(height: 8),

            /// 送信
            CustomElevatedButton(
              onPressed: formValidator.value
                  ? () async {
                      ref.read(displayNameProvider.notifier).state =
                          controller.text;
                      await ref
                          .read(userProfileNotifierProvider.notifier)
                          .updateDisplayName();

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MyHomePage(),
                        ),
                      );
                    }
                  : null,
              child: Text('OK'),
            ),
            SizedBox(height: 8),

            CustomElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('back'),
            ),
          ],
        ),
      ),
    );
  }
}
