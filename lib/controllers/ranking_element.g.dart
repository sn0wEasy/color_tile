// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking_element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RankingElement _$$_RankingElementFromJson(Map<String, dynamic> json) =>
    _$_RankingElement(
      deviceId: json['deviceId'] as String,
      platform: json['platform'] as String,
      displayName: json['displayName'] as String,
      totalScore: json['totalScore'] as int,
    );

Map<String, dynamic> _$$_RankingElementToJson(_$_RankingElement instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'platform': instance.platform,
      'displayName': instance.displayName,
      'totalScore': instance.totalScore,
    };
