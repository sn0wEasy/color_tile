import 'package:color_tile/controllers/block.dart';
import 'package:color_tile/controllers/block_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// mockito を使ってプロバイダによる Listener への通知を追跡する
class Listener extends Mock {
  void call(List<BlockModel>? previous, List<BlockModel> value);
}

void main() {
  test('blockModelProvider test', () {
    // プロバイダを利用するために必要なオブジェクト
    // このオブジェクトはテスト間で共有しない
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final listener = Listener();

    // プロバイダを監視して変化を検出する
    container.listen<List<BlockModel>>(
      blockModelProvider,
      listener,
      fireImmediately: true,
    );

    List<BlockModel> defaultModelList = [
      ...container.read(blockModelProvider.notifier).initialBlockModelList
    ];
    // この時点で Listener はデフォルト値で呼び出されているはず
    verify(listener(null, defaultModelList)).called(1);
    verifyNoMoreInteractions(listener);

    // ステートを変更する
    container.read(blockModelProvider.notifier).updateCoordinate(100, 100, 0);

    List<BlockModel> updatedModelList =
        container.read(blockModelProvider.notifier).state;

    // 今度は Listener が変更後の値で呼び出されているか確認
    verify(listener(defaultModelList, updatedModelList)).called(1);
    verifyNoMoreInteractions(listener);
  });
  test('the counter state is not shared between tests', () {
    // ProviderContainer を新たに作成してプロバイダを利用する
    // これによりテスト間でステートが再利用されないことを保証できる
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final listener = Listener();

    container.listen<List<BlockModel>>(
      blockModelProvider,
      listener,
      fireImmediately: true,
    );

    // このテストでもデフォルト値が使用されることを確認
    List<BlockModel> defaultModelList = [
      ...container.read(blockModelProvider.notifier).initialBlockModelList
    ];
    // この時点で Listener はデフォルト値で呼び出されているはず
    verify(listener(null, defaultModelList)).called(1);
    verifyNoMoreInteractions(listener);
  });
}
