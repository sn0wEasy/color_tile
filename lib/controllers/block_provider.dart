import 'package:color_tile/controllers/block.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:color_tile/constants.dart';
import 'package:quiver/iterables.dart';
import 'dart:math';

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

double randomGeneratorX() =>
    Random().nextDouble() * (kContainerWidth - kTileSize * 2) +
    kTileSize -
    kXConst;
double randomGeneratorY() =>
    Random().nextDouble() * (kContainerHeight - kTileSize * 2) +
    kTileSize -
    kYConst;

class BlockModelNotifier extends StateNotifier<List<BlockModel>> {
  BlockModelNotifier() : super(_blockModelList);

  void updateCoordinate(double x, double y, int index) {
    // 更新用のstateを用意する
    List<BlockModel> updatingState = [...state];
    // 更新前の要素をcopyWithして新しい要素に更新する
    updatingState[index] = updatingState[index].copyWith(finalX: x, finalY: y);
    // stateを更新する
    state = [...updatingState];
  }

  void initCoordinate() {
    // 更新用のstateを用意する
    List<BlockModel> updatingState = [...state];
    // 各要素についてcopyWithして新しい要素に更新する
    for (num i in range(updatingState.length)) {
      updatingState[i.toInt()] = updatingState[i.toInt()]
          .copyWith(finalX: randomGeneratorX(), finalY: randomGeneratorY());
    }
    // stateを更新する
    state = [...updatingState];
  }

  void arrangeCoordinate() {
    state = _blockModelList;
  }

  List<BlockModel> get initialBlockModelList => _blockModelList;
}

final blockModelProvider =
    StateNotifierProvider<BlockModelNotifier, List<BlockModel>>(
        (ref) => BlockModelNotifier());
