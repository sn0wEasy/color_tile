import 'package:color_tile/controllers/device_id_provider.dart';
import 'package:color_tile/controllers/ranking_element.dart';
import 'package:color_tile/controllers/user_profile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:color_tile/repositories/user_profile_repository.dart';

final rankingNotifierProvider =
    StateNotifierProvider<RankingNotifier, List<RankingElement>?>(
        (ref) => RankingNotifier(ref));

class RankingNotifier extends StateNotifier<List<RankingElement>?> {
  final Ref ref;
  RankingNotifier(this.ref) : super(null);

  // ランキングを更新
  Future<void> updateBestRecordRanking() async {
    final deviceId = await ref.watch(deviceIdProvider.future);
    final userProfileList =
        await ref.read(userProfileRepositoryProvider).getUserProfileList;
    List<RankingElement> ranking = <RankingElement>[];
    for (UserProfile e in userProfileList) {
      if (e.bestRecord != null) {
        ranking.add(
          RankingElement(
            deviceId: deviceId,
            platform: e.platform,
            displayName: e.displayName,
            totalScore: e.bestRecord!.totalScore,
          ),
        );
      }
    }
    ranking.sort(((e1, e2) => -1 * e1.totalScore.compareTo(e2.totalScore)));
    print(ranking);
    state = [...ranking];
  }
}
