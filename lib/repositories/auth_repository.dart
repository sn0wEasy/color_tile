import 'package:color_tile/controllers/general_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'custom_exception.dart';

// 抽象クラスを定義
abstract class BaseAuthRepository {
  // ログイン状態の確認用（ログイン状態の変更や初期化時にイベントする）
  Stream<User?> get authStateChanges;

  // サインイン（著名ユーザを作成）
  Future<void> signInAnonymously();

  // 現在サインインしているユーザを取得する。
  User? getCurrentUser();

  // ログアウト
  Future<void> signOut();
}

// AuthRepositoryを提供し、refを渡してアクセスできるようにする
final authRepositoryProvider =
    Provider<AuthRepository>((ref) => AuthRepository(ref));

// 認証リポジトリクラス
class AuthRepository implements BaseAuthRepository {
  // アプリ内の他のプロバイダーを読み取ることを許可
  final Ref ref;

  const AuthRepository(this.ref);

  // refを利用して、firebaseAuth.instanceにアクセス
  @override
  Stream<User?> get authStateChanges =>
      ref.read(firebaseAuthProvider).authStateChanges();

  // 匿名ユーザでログイン
  @override
  Future<void> signInAnonymously() async {
    try {
      await ref.read(firebaseAuthProvider).signInAnonymously();
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  // 既存の匿名ユーザを返却
  @override
  User? getCurrentUser() {
    try {
      return ref.read(firebaseAuthProvider).currentUser;
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  // サインアウトしたら、新たに匿名ユーザでログインさせる。
  @override
  Future<void> signOut() async {
    try {
      // サインアウト
      await ref.read(firebaseAuthProvider).signOut();
      // 匿名でサインイン
      await signInAnonymously();
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }
}
