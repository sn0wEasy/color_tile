import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginStateProvider =
    StateProvider<AsyncValue<void>>((_) => AsyncValue.data(null));
