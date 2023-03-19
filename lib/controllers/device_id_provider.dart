import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:device_info_plus/device_info_plus.dart';

final deviceIdProvider = FutureProvider<String>((ref) async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  WebBrowserInfo info = await deviceInfo.webBrowserInfo;
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
