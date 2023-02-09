import 'package:color_tile/component/constant_block.dart';
import 'package:color_tile/component/movable_block.dart';
import 'package:color_tile/component/submit_button.dart';
import 'package:color_tile/constants.dart';
import 'package:flutter/material.dart';
import 'package:quiver/iterables.dart';

class PlayingPage extends StatelessWidget {
  const PlayingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ARtile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: kContainerWidth,
              height: kContainerheight,
              color: Colors.transparent,
              child: Stack(
                children: [
                  ...[
                    for (num i in range(kConstantBlockProfile.length))
                      ConstantBlock(
                        kConstantBlockProfile[i.toInt()]['initialX'],
                        kConstantBlockProfile[i.toInt()]['initialY'],
                        kConstantBlockProfile[i.toInt()]['blockColor'],
                        i.toInt(),
                      )
                  ],
                  ...[
                    for (num i in range(kMovableBlockProfile.length))
                      MovableBlock(
                        kMovableBlockProfile[i.toInt()]['initialX'],
                        kMovableBlockProfile[i.toInt()]['initialY'],
                        kMovableBlockProfile[i.toInt()]['blockColor'],
                        i.toInt(),
                      )
                  ],
                ],
              ),
            ),
            const SizedBox(height: 30),
            const SubmitButton(),
          ],
        ),
      ),
    );
  }
}
