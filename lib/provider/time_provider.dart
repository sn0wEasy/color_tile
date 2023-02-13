import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

final stopwatchProvider =
    StateNotifierProvider<StopwatchNotifier, int>((ref) => StopwatchNotifier());

final displayTimeProvider = Provider<String>((ref) {
  final elapsedTime = ref.watch(stopwatchProvider);
  final int milliSeconds = ((elapsedTime / 10).floor() % 100);
  final int seconds = elapsedTime ~/ 1000 % 60;
  final int minutes = elapsedTime ~/ (1000 * 60) % 60;
  final displayedTime =
      '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}:${milliSeconds.toString().padLeft(2, '0')}';
  return displayedTime;
});
