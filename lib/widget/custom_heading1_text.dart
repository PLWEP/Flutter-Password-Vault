import 'package:flutter/material.dart';

class CustomHeading1Text extends StatelessWidget {
  final String title;
  const CustomHeading1Text({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(15),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
