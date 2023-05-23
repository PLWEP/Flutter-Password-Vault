import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController controller;
  const CustomTextInput(
      {super.key,
      required this.title,
      required this.hint,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: 5),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: hint,
            ),
            controller: controller,
          ),
        ],
      ),
    );
  }
}
