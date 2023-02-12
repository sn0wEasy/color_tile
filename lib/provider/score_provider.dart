import 'package:color_tile/model/block_model.dart';
import 'package:color_tile/provider/block_provider.dart';
import 'package:color_tile/provider/elapsedtime_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:math';

final timeScoreProvider =
    StateProvider<int>((ref) => ref.watch(elapsedTimeProvider) + 1);

// FIXME: スコア算出ロジックを「ブロックごと」から「ブロックの色ごと」に修正する
final distanceScoreProvider = Provider<int>((ref) {
  List<BlockModel> blockProfileList = ref.watch(blockModelProvider);
  double distanceSum = 0;
  blockProfileList.asMap().forEach((_, BlockModel blockProfile) {
    distanceSum += sqrt(pow(blockProfile.finalX - blockProfile.initialX, 2) +
        pow(blockProfile.finalY - blockProfile.initialY, 2));
  });
  final score = ((1 / (distanceSum + 1)) * pow(10, 6)).toInt();
  return score;
});

// FIXME: スコア算出ロジックを改良する
final totalScoreProvider = Provider<int>((ref) {
  int distanceScore = ref.watch(distanceScoreProvider);
  int timeScore = ref.watch(timeScoreProvider);
  int totalScore = distanceScore ~/ sqrt(timeScore);
  return totalScore;
});
