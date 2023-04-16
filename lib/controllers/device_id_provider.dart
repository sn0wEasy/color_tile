import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';

final deviceIdProvider = FutureProvider<String>((ref) async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  late final String deviceId;
  final uuid = const Uuid().v4();
  try {
    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      final prefsInfo = prefs.getString('deviceId');
      if (prefsInfo == null) {
        deviceId = uuid.hashCode.toString();
        await prefs.setString('deviceId', deviceId);
      } else {
        deviceId = prefsInfo;
      }
    } else if (Platform.isAndroid) {
      final info = await deviceInfo.androidInfo;
      deviceId =
          info.data.entries.map((e) => e.value).join().hashCode.toString();
    } else if (Platform.isIOS) {
      final info = await deviceInfo.iosInfo;
      deviceId =
          info.data.entries.map((e) => e.value).join().hashCode.toString();
    }
  } catch (e) {
    throw ('device is not supported: $e');
  }
  return deviceId;
});

final targetPlatformProvider = Provider<String>((ref) {
  if (kIsWeb) {
    return 'webBrowser';
  } else {
    return Platform.operatingSystem;
  }
});
final displayNameProvider = StateProvider<String>((ref) => 'Guest');
