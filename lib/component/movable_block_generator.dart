import 'package:color_tile/constants.dart';
import 'package:color_tile/component/movable_block.dart';

List<MovableBlock> movableBlockGenerator() {
  List<MovableBlock> ret = <MovableBlock>[];
  kMovableBlockConfiguration.asMap().forEach(
    (int blockIndex, var configDict) {
      ret.add(
        MovableBlock(
          configDict['initialX'],
          configDict['initialX'],
          configDict['blockIndex'],
          blockIndex,
        ),
      );
    },
  );
  return ret;
}
