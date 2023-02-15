import 'package:color_tile/model/block.dart';
import 'package:color_tile/constants.dart';
import 'package:color_tile/provider/block_provider.dart';
import 'package:color_tile/provider/time_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:math';
import 'package:color_tile/logic/permutation.dart';
import 'package:quiver/iterables.dart' as itr;

double calcDistance(double x1, double y1, double x2, double y2) {
  return sqrt(pow(x1 - x2, 2) + pow(y1 - y2, 2));
}

final timeScoreProvider =
    StateProvider<int>((ref) => ref.watch(stopwatchProvider) + 1);

// FIXME: スコア算出ロジックを「ブロックごと」から「ブロックの色ごと」に修正する
final distanceScoreProvider = Provider<int>((ref) {
  List<BlockModel> blockProfileList = ref.watch(blockModelProvider);
  double distanceSum = 0;
  blockProfileList.asMap().forEach((_, BlockModel blockProfile) {
    distanceSum += sqrt(pow(blockProfile.finalX - blockProfile.initialX, 2) +
        pow(blockProfile.finalY - blockProfile.initialY, 2));
  });

  // 1. 色ごとにブロックのリストを作成する
  List<List<BlockModel>> blockListByColor = kMovableColorList
      .map((e) => blockProfileList.where((e) => e.color == kYellow).toList())
      .toList();

  // 2. 色ごとに距離の合計の最小値を求める
  /// 初期座標リストは固定、最終座標リストは順列でループさせる
  for (List<BlockModel> coloredBlockList in blockListByColor) {
    List<double> coloredSumList = <double>[];
    for (List<BlockModel> fin in getPermutation(coloredBlockList)) {
      for (num i in itr.range(coloredBlockList.length)) {
        int j = i.toInt();
        coloredSumList.add(calcDistance(coloredBlockList[j].initialX,
            coloredBlockList[j].initialY, fin[j].finalX, fin[j].finalY));
      }
    }
    distanceSum += coloredSumList.reduce(min);
  }

  // FIXME: スコア算出ロジックを改良する
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
