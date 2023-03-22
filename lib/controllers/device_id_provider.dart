import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:device_info_plus/device_info_plus.dart';

final deviceIdProvider = FutureProvider<String>((ref) async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  late final info;
  try {
    if (kIsWeb) {
      info = await deviceInfo.webBrowserInfo;
    } else if (Platform.isAndroid) {
      info = await deviceInfo.androidInfo;
    } else if (Platform.isIOS) {
      info = await deviceInfo.iosInfo;
    }
  } catch (e) {
    throw ('device is not supported: $e');
  }
  String deviceId =
      info.data.entries.map((e) => e.value).join().hashCode.toString();
  return deviceId;
});

final targetPlatformProvider = Provider<String>((ref) {
  if (kIsWeb) {
    return 'WebBrowser';
  } else {
    return Platform.operatingSystem;
  }
});
final displayNameProvider = StateProvider<String>((ref) => 'Guest');

// final totalScoreRankingProvider = State
