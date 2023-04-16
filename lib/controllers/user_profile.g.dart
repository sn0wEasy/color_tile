// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserProfile _$$_UserProfileFromJson(Map<String, dynamic> json) =>
    _$_UserProfile(
      deviceId: json['deviceId'] as String,
      displayName: json['displayName'] as String,
      platform: json['platform'] as String,
      bestRecord: json['bestRecord'] == null
          ? null
          : Record.fromJson(json['bestRecord'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserProfileToJson(_$_UserProfile instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'displayName': instance.displayName,
      'platform': instance.platform,
      'bestRecord': instance.bestRecord,
    };
