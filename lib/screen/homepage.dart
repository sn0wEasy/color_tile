import 'package:color_tile/component/constant_block_generator.dart';
import 'package:color_tile/component/movable_block_generator.dart';
import 'package:color_tile/constants.dart';
import 'package:flutter/material.dart';

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
              ...constantBlockGenerator(),
              ...movableBlockGenerator(),
            ],
          ),
        ),
      ),
    );
  }
}
