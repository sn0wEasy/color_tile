import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:color_tile/repositories/auth_repository.dart';

final authControllerProvider = StateNotifierProvider<AuthController, User?>(
  (ref) => AuthController(ref)..appStarted(),
);

class AuthController extends StateNotifier<User?> {
  final Ref ref;

  StreamSubscription<User?>? _authStateChangesSubscription;

  AuthController(this.ref) : super(null) {
    // 受信停止
    _authStateChangesSubscription?.cancel();
    // 受信開始
    _authStateChangesSubscription = ref
        .read(authRepositoryProvider)
        .authStateChanges
        .listen((user) => state = user);
  }

  // 不要な受信をキャンセルするためにdisposeでキャンセルする
  @override
  void dispose() {
    _authStateChangesSubscription?.cancel();
    super.dispose();
  }

  // アプリ開始
  Future<void> appStarted() async {
    // Currentユーザを取得
    final user = ref.read(authRepositoryProvider).getCurrentUser();
    // ログインされていなければ、匿名でサインインしてログインさせる。
    if (user == null) {
      await ref.read(authRepositoryProvider).signInAnonymously();
    }
  }

  // サインアウト
  Future<void> signOut() async {
    // サインアウトメソッド
    await ref.read(authRepositoryProvider).signOut();
  }
}
