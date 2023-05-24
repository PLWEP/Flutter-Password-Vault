import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Icon icon;
  final Function() onPressed;
  const CustomIconButton(
      {super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      splashRadius: 20,
      constraints: const BoxConstraints(
        maxHeight: 24,
        maxWidth: 24,
      ),
      onPressed: onPressed,
      icon: icon,
    );
  }
}
