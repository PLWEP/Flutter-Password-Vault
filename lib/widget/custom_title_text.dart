import 'package:flutter/material.dart';

class CustomTitleText extends StatelessWidget {
  final String title;
  final TextStyle textStyle;
  const CustomTitleText(
      {super.key, required this.title, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        child: Text(
          title,
          style: textStyle,
        ),
      ),
    );
  }
}
