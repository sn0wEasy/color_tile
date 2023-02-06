import 'package:color_tile/provider/block_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SubmitButton extends HookConsumerWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () {
        print('score: ${ref.watch(scoreProvider)}');
      },
      child: Text('submit'),
    );
  }
}
