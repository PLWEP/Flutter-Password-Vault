import 'package:flutter/material.dart';

class CustomTitleText extends StatelessWidget {
  final String title;
  const CustomTitleText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
