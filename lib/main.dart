import 'package:color_tile/screen/playing_page.dart';
import 'package:color_tile/screen/result_page.dart';
import 'package:flutter/material.dart';
import 'package:color_tile/screen/title_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ARtile',
      home: const MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext contest) => const MyHomePage(),
        '/playing': (BuildContext context) => PlayingPage(),
        '/result': (BuildContext context) => const ResultPage(),
      },
    );
  }
}
