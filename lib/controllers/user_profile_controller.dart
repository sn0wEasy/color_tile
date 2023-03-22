import 'package:color_tile/controllers/user_profile.dart';
import 'package:color_tile/repositories/user_profile_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userProfileNotifierProvider =
    StateNotifierProvider<UserProfileNotifier, UserProfile?>(
        (ref) => UserProfileNotifier(ref));

class UserProfileNotifier extends StateNotifier<UserProfile?> {
  final Ref ref;
  UserProfileNotifier(this.ref) : super(null);

  // ユーザプロファイルを初期化
  void init() async {
    ref.read(userProfileRepositoryProvider).initUserProfile();
  }

  // 表示名を更新
  void updateDisplayName() async {
    ref.read(userProfileRepositoryProvider).updateDisplayName();
  }

  // ベストレコードを更新
  void updateBestRecord() async {
    ref.read(userProfileRepositoryProvider).updateBestRecord();
  }
}
