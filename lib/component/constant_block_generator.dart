import 'package:color_tile/constants.dart';
import 'package:color_tile/component/constant_block.dart';

List<ConstantBlock> constantBlockGenerator() {
  List<ConstantBlock> ret = <ConstantBlock>[];
  kConstantBlockConfiguration.asMap().forEach(
    (int blockIndex, var configDict) {
      ret.add(
        ConstantBlock(
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
