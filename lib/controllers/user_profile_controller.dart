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
  Future<void> init() async {
    final userProfile =
        await ref.read(userProfileRepositoryProvider).userProfile;
    if (userProfile == null) {
      await ref.read(userProfileRepositoryProvider).updateDisplayName();
      await ref.read(userProfileRepositoryProvider).updatePlatform();
    }
  }

  // 表示名を更新
  Future<void> updateDisplayName() async {
    await ref.read(userProfileRepositoryProvider).updateDisplayName();
  }

  // ベストレコードを更新
  Future<void> updateBestRecord() async {
    await ref.read(userProfileRepositoryProvider).updateBestRecord();
  }
}
