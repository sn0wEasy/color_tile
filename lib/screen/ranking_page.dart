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
      loading: () => const CircularProgressIndicator(),
      error: (err, _) => Text('$err'),
      data: (deviceId) => Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20),
                Text('トータルスコアランキング'),
                SizedBox(height: 10),
                SizedBox(
                  width: 350,
                  height: MediaQuery.of(context).size.height - 150,
                  child: ListView(
                    children: [
                      ...createRankingList(context, rankingElements, deviceId),
                    ],
                  ),
                ),
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
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> createRankingList(BuildContext context,
      List<RankingElement>? elements, String userDeviceId) {
    return elements != null
        ? elements.mapIndexed((i, e) {
            final cardColor = userDeviceId == e.deviceId
                ? Theme.of(context).colorScheme.inversePrimary
                : Theme.of(context).colorScheme.surface;
            final platformIcon = e.platform == 'ios' || e.platform == 'android'
                ? const Icon(
                    Icons.smartphone,
                    size: 20,
                  )
                : const Icon(
                    Icons.computer,
                    size: 20,
                  );
            return SizedBox(
              width: 350,
              height: 50,
              child: Card(
                color: cardColor,
                child: Row(
                  children: [
                    const SizedBox(width: 5),
                    i < 3
                        ? const Icon(
                            Icons.workspace_premium,
                            color: Colors.deepPurple,
                          )
                        : Icon(
                            Icons.workspace_premium,
                            color: Colors.deepPurple.withOpacity(0),
                          ),
                    const SizedBox(width: 5),
                    SizedBox(
                      width: 23,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text('${i + 1}'),
                      ),
                    ),
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
                    const SizedBox(width: 20),
                    platformIcon,
                  ],
                ),
              ),
            );
          }).toList()
        : <Widget>[const Text('no ranker')];
  }
}
