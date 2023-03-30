import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  Function()? onPressed;
  Widget child;

  CustomElevatedButton({this.onPressed, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
      style: ElevatedButton.styleFrom(fixedSize: Size(150, 30)),
    );
  }
}
