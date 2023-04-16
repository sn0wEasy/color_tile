import 'package:color_tile/screen/ranking_page.dart';
import 'package:color_tile/screen/register_page.dart';
import 'package:color_tile/screen/playing_page.dart';
import 'package:color_tile/screen/result_page.dart';
import 'package:flutter/material.dart';
import 'package:color_tile/screen/title_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'color_schemes.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // name: '---',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ARtile',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        fontFamily: "DotGothic16",
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        fontFamily: "DotGothic16",
      ),
      home: const MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => const MyHomePage(),
        '/register': (BuildContext context) => RegisterPage(),
        '/playing': (BuildContext context) => const PlayingPage(),
        '/result': (BuildContext context) => const ResultPage(),
        '/ranking': (BuildContext context) => const RankingPage(),
      },
    );
  }
}
