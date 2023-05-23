import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  const CustomElevatedButton(
      {super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: ElevatedButton(
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(
            Size(double.maxFinite, 50),
          ),
        ),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
