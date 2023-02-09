import 'package:color_tile/model/block_model.dart';
import 'package:color_tile/provider/block_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:math';

final distanceScoreProvider = Provider<int>((ref) {
  List<BlockModel> blockProfileList = ref.watch(blockModelProvider);
  double score = 0;
  blockProfileList.asMap().forEach((_, BlockModel blockProfile) {
    score += sqrt(pow(blockProfile.finalX - blockProfile.initialX, 2) +
        pow(blockProfile.finalY - blockProfile.initialY, 2));
  });
  final normalizedScore = ((1 / (score + 1)) * pow(10, 6)).toInt();
  return normalizedScore;
});

final totalScoreProvider = Provider<int>((ref) {
  int distanceScore = ref.watch(distanceScoreProvider);
  int timeScore = 30;
  final totalScore = distanceScore ~/ timeScore;
  return totalScore;
});
