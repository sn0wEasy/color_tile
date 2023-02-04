import 'package:color_tile/constants.dart';
import 'package:flutter/material.dart';
import 'package:color_tile/component/movable_block.dart';
import 'package:color_tile/component/constant_block.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Container(
          width: kContainerWidth,
          height: kContainerheight,
          color: Colors.transparent,
          child: Stack(
            children: [
              // upper constant block
              ConstantBlock(41, 0, kGrey),
              ConstantBlock(130, 0, kGrey),
              ConstantBlock(175, 0, kGrey),
              ConstantBlock(232, 0, kGrey),
              // upper movable block
              MovableBlock(0.2, 0, kYellow),
              MovableBlock(48, 0, kTeal),
              MovableBlock(89.2, 0, kBlue),
              MovableBlock(144, 0, kRed),
              MovableBlock(216, 0, kBlue),
              MovableBlock(258, 0, kTeal),
              // lower constant block
              ConstantBlock(20, 41, kGrey),
              ConstantBlock(89.1, 41, kGrey),
              ConstantBlock(185, 41, kGrey),
              ConstantBlock(258, 41, kGrey),
              // lower movable block
              MovableBlock(0, 41, kBlue),
              MovableBlock(48, 41, kPink),
              MovableBlock(130.8, 41, kTeal),
              MovableBlock(172, 41, kYellow),
              MovableBlock(217, 41, kRed),
            ],
          ),
        ),
      ),
    );
  }
}
