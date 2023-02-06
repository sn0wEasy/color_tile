import 'package:color_tile/model/block_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:math';
import 'package:color_tile/constants.dart';
import 'package:quiver/iterables.dart';

final _blockModelList = [
  for (num i in range(kMovableBlockProfile.length))
    BlockModel(
      initialX: kMovableBlockProfile[i.toInt()]['initialX'],
      initialY: kMovableBlockProfile[i.toInt()]['initialY'],
      finalX: kMovableBlockProfile[i.toInt()]['initialX'],
      finalY: kMovableBlockProfile[i.toInt()]['initialY'],
      color: kMovableBlockProfile[i.toInt()]['blockColor'],
      index: i.toInt(),
    )
];

class BlockModelNotifier extends StateNotifier<List<BlockModel>> {
  BlockModelNotifier() : super(_blockModelList);

  void updateCoordinate(double x, double y, int index) {
    // 更新前の要素をcopyWithして新しい要素を作成する
    BlockModel newBlock = state[index].copyWith(finalX: x, finalY: y);
    // 更新前の要素をindexを元にstateから削除する
    state.remove(state[index]);
    // stateと新しい要素を元に新しいリストを作成し、stateに代入する
    state = [...state, newBlock]..sort((a, b) => a.index.compareTo(b.index));
  }
}

final blockModelProvider =
    StateNotifierProvider<BlockModelNotifier, List<BlockModel>>(
        (ref) => BlockModelNotifier());

final scoreProvider = Provider<double>((ref) {
  List<BlockModel> blockProfileList = ref.watch(blockModelProvider);
  double score = 0;
  blockProfileList.asMap().forEach((_, BlockModel blockProfile) {
    score += sqrt(pow(blockProfile.finalX - blockProfile.initialX, 2) +
        pow(blockProfile.finalY - blockProfile.initialY, 2));
  });
  return score;
});
