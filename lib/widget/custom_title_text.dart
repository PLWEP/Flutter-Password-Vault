import 'package:flutter/material.dart';
import 'package:pasword_vault/common/global_variable.dart';

class CustomTitleText extends StatelessWidget {
  final String title;
  final TextStyle textStyle;
  const CustomTitleText(
      {super.key, required this.title, this.textStyle = titleStyle});

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
