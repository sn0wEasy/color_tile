import 'package:color_tile/controllers/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ユーザアカウントを作成し認証情報を保持するアカウント
final userCreateProvider = FutureProvider.autoDispose
    .family<UserCredential, UserState>((ref, user) async {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: user.id,
    password: user.password,
  );

  return credential;
});
