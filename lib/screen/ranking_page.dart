import 'package:color_tile/color_schemes.g.dart';
import 'package:color_tile/controllers/device_id_provider.dart';
import 'package:color_tile/controllers/ranking_controller.dart';
import 'package:color_tile/controllers/ranking_element.dart';
import 'package:color_tile/screen/title_page.dart';
import 'package:color_tile/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:collection/collection.dart';

class RankingPage extends ConsumerWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rankingElements = ref.watch(rankingNotifierProvider);
    final deviceId = ref.watch(deviceIdProvider);

    return deviceId.when(
      loading: () => CircularProgressIndicator(),
      error: (err, _) => Text('$err'),
      data: (deviceId) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Best Total Score Ranking'),
              SizedBox(height: 10),
              ...createRankingList(rankingElements, deviceId),
              SizedBox(height: 10),
              CustomElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MyHomePage(),
                    ),
                  );
                },
                child: Text('Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> createRankingList(
      List<RankingElement>? elements, String userDeviceId) {
    return elements != null
        ? elements.mapIndexed((i, e) {
            final cardColor = userDeviceId == e.deviceId
                ? lightColorScheme.inversePrimary
                : Colors.white;
            return SizedBox(
              width: 300,
              height: 50,
              child: Card(
                color: cardColor,
                child: Row(
                  children: [
                    const SizedBox(width: 5),
                    i == 0
                        ? const Icon(
                            Icons.workspace_premium,
                            color: Colors.deepPurple,
                          )
                        : Icon(
                            Icons.workspace_premium,
                            color: Colors.deepPurple.withOpacity(0),
                          ),
                    const SizedBox(width: 5),
                    Text('${i + 1}'),
                    SizedBox(width: 15),
                    SizedBox(
                      width: 150,
                      child: Text('${e.displayName}'),
                    ),
                    const SizedBox(width: 5),
                    SizedBox(
                      width: 60,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text('${e.totalScore}'),
                      ),
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
              ),
            );
          }).toList()
        : <Widget>[const Text('no ranker')];
  }
}
