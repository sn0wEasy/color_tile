import 'package:color_tile/constants.dart';
import 'package:color_tile/controllers/device_id_provider.dart';
import 'package:color_tile/controllers/record.dart';
import 'package:color_tile/controllers/score_provider.dart';
import 'package:color_tile/controllers/time_provider.dart';
import 'package:color_tile/controllers/user_profile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

// 抽象クラスを定義
abstract class BaseUserProfileRepository {
  // 全ユーザのプロファイルを取得する
  Future<List<UserProfile?>> get getUserProfileList;

  // ユーザ単体のプロファイルを取得
  Future<UserProfile?> get userProfile;

  // ユーザプロファイルを初期化
  void initUserProfile();

  // displayNameを更新
  void updateDisplayName();

  // bestRecordを更新
  void updateBestRecord();
}

// UserProfileRepositoryを提供し、refを渡してアクセスできるようにする
final userProfileRepositoryProvider =
    Provider<UserProfileRepository>((ref) => UserProfileRepository(ref));

// リポジトリクラス
class UserProfileRepository implements BaseUserProfileRepository {
  // アプリ内の他のプロバイダーを読み取ることを許可
  final Ref ref;

  const UserProfileRepository(this.ref);

  @override
  Future<List<UserProfile>> get getUserProfileList async {
    try {
      final dbRef = FirebaseDatabase.instanceFor(
        app: Firebase.app(),
        databaseURL: databaseURL,
      ).ref('userProfile');
      final snapshot = await dbRef.get();
      if (!snapshot.exists) {
        print('No data available.');
        return <UserProfile>[];
      }
      // 全ユーザのプロファイルをリモートから取得
      final snapshotValueMap =
          Map<String, dynamic>.from(snapshot.value! as Map<Object?, Object?>);
      // UserProfile オブジェクトに変換
      return snapshotValueMap.entries
          .map(
            (e) => UserProfile(
              deviceId: e.key,
              displayName: e.value['displayName'],
              platform: e.value['platform'],
              bestRecord: Record(
                time: e.value['time'] ?? '00:00:00',
                accuracy: e.value['accuracy'] ?? 0,
                totalScore: e.value['bestRecord'] != null
                    ? e.value['bestRecord']['totalScore']
                    : 0,
              ),
            ),
          )
          .toList();
    } catch (e) {
      throw ('Error: $e');
    }
  }

  @override
  Future<UserProfile?> get userProfile async {
    String deviceId = await ref.watch(deviceIdProvider.future);

    final dbRef = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL: databaseURL,
    ).ref('userProfile/$deviceId');
    final snapshot = await dbRef.get();
    if (!snapshot.exists) {
      print('No data available.');
      return null;
    }
    // deviceId に紐づくプロファイルをリモートから取得
    final snapshotValueMap =
        Map<String, dynamic>.from(snapshot.value! as Map<Object?, Object?>);
    // UserProfile オブジェクトに変換
    return UserProfile(
      deviceId: deviceId,
      displayName: snapshotValueMap['displayName'],
      platform: snapshotValueMap['platform'],
      bestRecord: snapshotValueMap['bestRecord'],
    );
  }

  @override
  void initUserProfile() async {
    String deviceId = await ref.watch(deviceIdProvider.future);

    final dbRef = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL: databaseURL,
    ).ref('userProfile');
    try {
      await dbRef.update({
        '$deviceId/displayName': ref.watch(displayNameProvider),
        '$deviceId/platform': ref.watch(targetPlatformProvider),
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void updateDisplayName() async {
    String deviceId = await ref.watch(deviceIdProvider.future);

    final dbRef = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL: databaseURL,
    ).ref('userProfile');
    try {
      await dbRef.update(
        {'$deviceId/displayName': ref.watch(displayNameProvider)},
      );
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void updateBestRecord() async {
    String deviceId = await ref.watch(deviceIdProvider.future);

    final time = ref.watch(displayDiscreteTimeProvider);
    final accuracy = ref.watch(displayDistanceScoreProvider);
    final totalScore = ref.watch(totalScoreProvider);

    final dbRef = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL: databaseURL,
    ).ref('userProfile/$deviceId/bestRecord');

    try {
      await dbRef.update(
        Record(
          time: time,
          accuracy: accuracy,
          totalScore: totalScore,
        ).toJson(),
      );
    } catch (e) {
      print('Error: $e');
    }
  }
}
