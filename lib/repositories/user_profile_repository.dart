import 'package:color_tile/controllers/device_id_provider.dart';
import 'package:color_tile/controllers/record.dart';
import 'package:color_tile/controllers/score_provider.dart';
import 'package:color_tile/controllers/time_provider.dart';
import 'package:color_tile/controllers/user_profile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// 抽象クラスを定義
abstract class BaseUserProfileRepository {
  // 全ユーザのプロファイルを取得する
  Future<List<UserProfile>> get getUserProfileList;

  // ユーザ単体のプロファイルを取得
  Future<UserProfile?> get userProfile;

  // ユーザのハイスコアを取得
  Future<int> get highScore;

  // ユーザの表示名を取得
  Future<String> get displayName;

  // displayNameを更新
  Future<void> updateDisplayName();

  // platformを更新
  Future<void> updatePlatform();

  // bestRecordを更新
  Future<void> updateBestRecord();
}

// UserProfileRepositoryを提供し、refを渡してアクセスできるようにする
final userProfileRepositoryProvider =
    Provider<UserProfileRepository>((ref) => UserProfileRepository(ref));

// リポジトリクラス
class UserProfileRepository implements BaseUserProfileRepository {
  // アプリ内の他のプロバイダーを読み取ることを許可
  final Ref ref;
  final db = FirebaseFirestore.instance;

  UserProfileRepository(this.ref);

  @override
  Future<List<UserProfile>> get getUserProfileList async {
    final docRef = db.collection('userProfile').doc('database');
    final doc = await docRef.get();
    if (!doc.exists) {
      return <UserProfile>[];
    }
    final data = doc.data() as Map<String, dynamic>;
    return data.entries
        .map(
          (e) => e.value['bestRecord'] != null
              ? UserProfile(
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
                )
              : UserProfile(
                  deviceId: e.key,
                  displayName: e.value['displayName'],
                  platform: e.value['platform'],
                ),
        )
        .toList();
  }

  @override
  Future<UserProfile?> get userProfile async {
    String deviceId = await ref.watch(deviceIdProvider.future);
    print('deviceId: $deviceId');

    final docRef = db.collection('userProfile').doc('database');
    final doc = await docRef.get();
    if (!doc.exists) {
      throw ('Error: userProfile getter');
    }
    final data = doc.data() as Map<String, dynamic>;
    final userData = data[deviceId];

    if (userData == null) {
      return null;
    }

    return userData['bestRecord'] != null
        ? UserProfile(
            deviceId: deviceId,
            displayName: userData['displayName'],
            platform: userData['platform'],
            bestRecord: Record(
              accuracy: userData['bestRecord']['accuracy'],
              totalScore: userData['bestRecord']['totalScore'],
              time: userData['bestRecord']['time'],
            ),
          )
        : UserProfile(
            deviceId: deviceId,
            displayName: userData['displayName'],
            platform: userData['platform'],
          );
  }

  @override
  Future<int> get highScore async {
    try {
      final profile = await userProfile;
      return profile!.bestRecord != null ? profile.bestRecord!.totalScore : 0;
    } catch (e) {
      throw ('Error: get highScore');
    }
  }

  @override
  Future<String> get displayName async {
    try {
      final profile = await userProfile;
      return profile!.displayName;
    } catch (e) {
      throw ('Error: get displayName');
    }
  }

  @override
  Future<void> updateDisplayName() async {
    String deviceId = await ref.watch(deviceIdProvider.future);

    final docRef = db.collection('userProfile').doc('database');
    try {
      await docRef.update({
        '$deviceId.displayName': ref.watch(displayNameProvider),
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Future<void> updatePlatform() async {
    String deviceId = await ref.watch(deviceIdProvider.future);

    final docRef = db.collection('userProfile').doc('database');
    try {
      await docRef.update({
        '$deviceId.platform': ref.watch(targetPlatformProvider),
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Future<void> updateBestRecord() async {
    String deviceId = await ref.watch(deviceIdProvider.future);

    final time = ref.watch(displayDiscreteTimeProvider);
    final accuracy = ref.watch(displayDistanceScoreProvider);
    final totalScore = ref.watch(totalScoreProvider);

    final docRef = db.collection('userProfile').doc('database');
    try {
      await docRef.update({
        '$deviceId.bestRecord': Record(
          time: time,
          accuracy: accuracy,
          totalScore: totalScore,
        ).toJson(),
      });
    } catch (e) {
      print('Error: $e');
    }
  }
}
