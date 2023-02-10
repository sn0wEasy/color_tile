import 'package:color_tile/screen/playing_page.dart';
import 'package:color_tile/screen/result_page.dart';
import 'package:flutter/material.dart';
import 'package:color_tile/screen/homepage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );
  }

  final _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const MyHomePage(),
      ),
      GoRoute(
        path: '/playing',
        builder: (context, state) => PlayingPage(),
      ),
      GoRoute(
        path: '/result',
        builder: (context, state) => const ResultPage(),
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: Scaffold(
        body: Center(
          child: Text(state.error.toString()),
        ),
      ),
    ),
  );
}
