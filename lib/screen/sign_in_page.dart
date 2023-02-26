import 'package:color_tile/screen/title_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInPage extends HookConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final idController = useTextEditingController();
    final passwdController = useTextEditingController();

    return Scaffold(
      body: Column(
        children: [
          /// メールアドレス入力
          TextField(
            decoration: const InputDecoration(
              label: Text('E-mail'),
            ),
            controller: idController,
          ),

          /// パスワード入力
          TextField(
            decoration: const InputDecoration(
              label: Text('Password'),
            ),
            controller: passwdController,
            obscureText: true,
          ),

          /// 送信
          ElevatedButton(
            onPressed: () {
              _signIn(idController.text, passwdController.text);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MyHomePage(),
                ),
              );
            },
            child: Text('push'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('back'),
          ),
        ],
      ),
    );
  }
}

void _signIn(String id, String pass) async {
  try {
    /// credential にはアカウント情報が記録される
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: id,
      password: pass,
    );
    print('Credintial: ');
    print(credential);
  }

  /// サインインに失敗した場合のエラー処理
  on FirebaseAuthException catch (e) {
    /// メールアドレスが無効の場合
    if (e.code == 'invalid-email') {
      print('メールアドレスが無効です');
    }

    /// ユーザーが存在しない場合
    else if (e.code == 'user-not-found') {
      print('ユーザーが存在しません');
    }

    /// パスワードが間違っている場合
    else if (e.code == 'wrong-password') {
      print('パスワードが間違っています');
    }

    /// その他エラー
    else {
      print('サインインエラー');
    }
  }
}
