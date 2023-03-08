import 'package:color_tile/controllers/login_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

// FIXME: 端末IDとセットでユーザ名を登録・参照できるようにする
final userServiceProvider = StateProvider<String>((ref) => 'Guest');

// final userServiceProvider = Provider(
//   UserService.new,
// );

// class UserService {
//   UserService(this.ref);

//   final Ref ref;

//   Future<void> login(String id, String password) async {
//     final notifier = ref.read(loginStateProvider.notifier);
//     notifier.state = const AsyncValue.loading();
//     notifier.state = await AsyncValue.guard(() async {
//       Future<UserCredential?> credential = _signIn(id, password);
//     });
//   }

//   Future<UserCredential?> _signIn(String id, String pass) async {
//     /// credential にはアカウント情報が記録される
//     final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//       email: id,
//       password: pass,
//     );
//     print('Credintial: ');
//     print(credential);

//     return credential;
//   }
// }
