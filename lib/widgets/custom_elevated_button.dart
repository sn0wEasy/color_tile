import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  Function()? onPressed;
  Widget child;

  CustomElevatedButton({this.onPressed, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(fixedSize: const Size(150, 30)),
      child: child,
    );
  }
}
