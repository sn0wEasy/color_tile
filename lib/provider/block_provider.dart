import 'package:color_tile/model/block_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
    // 更新用のstateを用意する
    List<BlockModel> updatingState = [...state];
    // 更新前の要素をcopyWithして新しい要素を作成する
    BlockModel newBlock = updatingState[index].copyWith(finalX: x, finalY: y);
    // 更新前の要素をindexを元にstateから削除する
    updatingState.remove(updatingState[index]);
    // stateと新しい要素を元に新しいリストを作成し、stateに代入する
    state = [...updatingState, newBlock]
      ..sort((a, b) => a.index.compareTo(b.index));
  }

  void initCoordinate() {
    // FIXME: 初期化はブロックを指定範囲内にランダムに配置する
    state = _blockModelList;
  }

  void arrangeCoordinate() {
    state = _blockModelList;
  }

  List<BlockModel> get currentBlockModelList => state;

  List<BlockModel> get initialBlockModelList => _blockModelList;
}

final blockModelProvider =
    StateNotifierProvider<BlockModelNotifier, List<BlockModel>>(
        (ref) => BlockModelNotifier());
