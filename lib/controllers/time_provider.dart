import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Stopwatchの状態を管理するNotifier
class StopwatchNotifier extends StateNotifier<int> {
  StopwatchNotifier() : super(0);
  final Stopwatch timer = Stopwatch();

  void start() {
    timer.start();
    _keepRunning();
  }

  void stop() => timer.stop();
  void reset() => timer.reset();

  void _keepRunning() {
    if (timer.isRunning) {
      state = timer.elapsedMilliseconds;
      Timer(const Duration(milliseconds: 10), _keepRunning);
    }
  }
}

/// Stopwatchの値（ミリ秒）を連続的に公開するプロバイダ
final stopwatchContinuousProvider =
    StateNotifierProvider<StopwatchNotifier, int>((ref) => StopwatchNotifier());

/// Stopwatchの値（時刻）を連続的に公開するプロバイダ
final displayContinuousTimeProvider = Provider<String>((ref) {
  final elapsedTime = ref.watch(stopwatchContinuousProvider);
  final int milliSeconds = ((elapsedTime / 10).floor() % 100);
  final int seconds = elapsedTime ~/ 1000 % 60;
  final int minutes = elapsedTime ~/ (1000 * 60) % 60;
  final displayedTime =
      '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}:${milliSeconds.toString().padLeft(2, '0')}';
  return displayedTime;
});

/// submitボタンが押された時のストップウォッチの時間を通知するNotifier
class SubmitTimeNotifier extends StateNotifier<int> {
  SubmitTimeNotifier(this.ref) : super(0);

  final Ref ref;
  void push() {
    state = ref.read(stopwatchContinuousProvider);
  }
}

/// Stopwatchの値（ミリ秒）を離散的に公開するプロバイダ
// リザルトに表示される値がストップウォッチに合わせて更新され続けるのを防止する
final stopwatchDiscreteProvider =
    StateNotifierProvider<SubmitTimeNotifier, int>(
        (ref) => SubmitTimeNotifier(ref));

/// Stopwatchの値（時刻）を離散的に公開するプロバイダ
final displayDiscreteTimeProvider = Provider<String>((ref) {
  final elapsedTime = ref.watch(stopwatchDiscreteProvider);
  final int milliSeconds = ((elapsedTime / 10).floor() % 100);
  final int seconds = elapsedTime ~/ 1000 % 60;
  final int minutes = elapsedTime ~/ (1000 * 60) % 60;
  final displayedTime =
      '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}:${milliSeconds.toString().padLeft(2, '0')}';
  return displayedTime;
});
