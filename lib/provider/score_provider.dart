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

// submitボタンが押された時のTimeScoreを公開するプロバイダ
final timeScoreProvider =
    StateProvider<int>((ref) => ref.watch(stopwatchDiscreteProvider) + 1);

// push()が実行された時のDistanceScoreを通知するNotifier
class SubmitDistanceScoreNotifier extends StateNotifier<int> {
  SubmitDistanceScoreNotifier(this.ref) : super(0);

  Ref ref;

  void push() {
    state = ref.read(distanceScoreProvider);
  }
}

// submitボタンが押された時のDistanceScoreを公開するプロバイダ
final displayDistanceScoreProvider =
    StateNotifierProvider<SubmitDistanceScoreNotifier, int>(
        (ref) => SubmitDistanceScoreNotifier(ref));

// 現在のblockModelProviderの状態に応じたDistanceScoreを公開するプロバイダ
final distanceScoreProvider = Provider<int>((ref) {
  List<BlockModel> blockProfileList = ref.watch(blockModelProvider);
  double distanceSum = 0;

  /// 1. 色ごとにブロックのリストを作成する
  List<List<BlockModel>> blockListByColor = kMovableColorList
      .map((e) => blockProfileList.where((e) => e.color == kYellow).toList())
      .toList();

  /// 2. 色ごとに距離の合計の最小値を求める
  // 初期座標リストは固定、最終座標リストは順列でループさせる
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

// トータルスコアを公開するプロバイダ
final totalScoreProvider = Provider<int>((ref) {
  // FIXME: スコア算出ロジックを改良する
  int distanceScore = ref.watch(displayDistanceScoreProvider);
  int timeScore = ref.watch(timeScoreProvider);
  int totalScore = distanceScore ~/ sqrt(timeScore);
  return totalScore;
});

// ハイスコアを管理するNotifier
class HighScoreNotifier extends StateNotifier<int> {
  HighScoreNotifier(this.ref) : super(0);

  Ref ref;

  void updateHighScore() {
    final currentScore = ref.read(totalScoreProvider);
    state = state >= currentScore ? state : currentScore;
  }

  int get getHighScore => state;
}

// ハイスコアを公開するプロバイダ
final highScoreProvider = StateNotifierProvider<HighScoreNotifier, int>(
    (ref) => HighScoreNotifier(ref));

// ハイスコアと最新スコアの比較用に古いハイスコアを管理するNotifier
class OldHighScoreNotifier extends StateNotifier<int> {
  OldHighScoreNotifier(this.ref) : super(0);

  Ref ref;

  void updateHighScore() {
    final currentScore = ref.read(totalScoreProvider);
    state = state >= currentScore ? state : currentScore;
  }

  int get getHighScore => state;
}

// ハイスコアと最新スコアの比較用に古いハイスコアを保持するプロバイダ
final oldHighScoreProvider = StateNotifierProvider<OldHighScoreNotifier, int>(
    (ref) => OldHighScoreNotifier(ref));

// ハイスコアと最新スコアの差分を公開するプロバイダ
final scoreDiffProvider = Provider<int>((ref) {
  final highScore = ref.watch(oldHighScoreProvider);
  final currentScore = ref.watch(totalScoreProvider);
  return currentScore - highScore;
});
