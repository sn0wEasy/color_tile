import 'package:color_tile/constants.dart';
import 'package:color_tile/controllers/auth_controller.dart';
import 'package:color_tile/controllers/device_id_provider.dart';
import 'package:color_tile/controllers/record.dart';
import 'package:color_tile/controllers/score_provider.dart';
import 'package:color_tile/controllers/time_provider.dart';
import 'package:color_tile/controllers/user_profile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

final userProfileNotifierProvider =
    StateNotifierProvider<UserProfileNotifier, UserProfile?>(
        (ref) => UserProfileNotifier(ref));

class UserProfileNotifier extends StateNotifier<UserProfile?> {
  final Ref ref;
  UserProfileNotifier(this.ref) : super(null);

  void init() async {
    String deviceId = await ref.watch(deviceIdProvider.future);

    DatabaseReference dbRef = FirebaseDatabase.instanceFor(
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

  void updateDisplayName() async {
    String deviceId = await ref.watch(deviceIdProvider.future);

    DatabaseReference dbRef = FirebaseDatabase.instanceFor(
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

  // ベストレコードを更新
  void updateBestRecord() async {
    String deviceId = await ref.watch(deviceIdProvider.future);

    final time = ref.watch(displayDiscreteTimeProvider);
    final accuracy = ref.watch(displayDistanceScoreProvider);
    final totalScore = ref.watch(totalScoreProvider);

    DatabaseReference dbRef = FirebaseDatabase.instanceFor(
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
