import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  final String title;
  final String hint;
  final bool validate;
  final String errorMessage;
  final TextEditingController controller;
  const CustomTextInput({
    super.key,
    required this.title,
    required this.hint,
    required this.controller,
    required this.validate,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 5),
          TextField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              errorText: validate ? null : errorMessage,
              hintText: hint,
            ),
            controller: controller,
          ),
        ],
      ),
    );
  }
}
