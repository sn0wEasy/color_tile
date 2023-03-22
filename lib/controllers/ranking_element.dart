import 'package:freezed_annotation/freezed_annotation.dart';
part 'ranking_element.freezed.dart';
part 'ranking_element.g.dart';

@freezed
class RankingElement with _$RankingElement {
  const factory RankingElement({
    required String deviceId,
    required String platform,
    required String displayName,
    required int totalScore,
  }) = _RankingElement;

  factory RankingElement.fromJson(Map<String, dynamic> json) =>
      _$RankingElementFromJson(json);
}
