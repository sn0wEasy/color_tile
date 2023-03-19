import 'package:color_tile/controllers/record.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    String? displayName,
    String? platform,
    Record? bestRecord,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
