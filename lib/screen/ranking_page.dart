import 'package:color_tile/controllers/ranking_controller.dart';
import 'package:color_tile/controllers/ranking_element.dart';
import 'package:color_tile/screen/title_page.dart';
import 'package:color_tile/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RankingPage extends ConsumerWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rankingElements = ref.watch(rankingNotifierProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Best Total Score Ranking'),
            SizedBox(height: 10),
            ...createRankingList(rankingElements),
            SizedBox(height: 10),
            CustomElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage(),
                  ),
                );
              },
              child: Text('back'),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> createRankingList(List<RankingElement>? elements) {
    return elements != null
        ? elements
            .map(
              (e) => Container(
                width: 200,
                decoration: BoxDecoration(
                    border: Border.all(
                  width: 4,
                )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${e.displayName}'),
                    Text('${e.totalScore}'),
                  ],
                ),
              ),
            )
            .toList()
        : <Widget>[const Text('no ranker')];
  }
}
