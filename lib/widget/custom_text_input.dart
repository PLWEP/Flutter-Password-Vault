import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  final String title;
  final String hint;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final bool obsecureText;
  final TextEditingController controller;
  const CustomTextInput({
    super.key,
    required this.title,
    required this.hint,
    required this.validator,
    this.onChanged,
    this.obsecureText = false,
    required this.controller,
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
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: hint,
            ),
            obscureText: obsecureText,
            validator: validator,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

class PasswordTextInput extends CustomTextInput {
  const PasswordTextInput(
      {super.key,
      required super.title,
      required super.hint,
      required super.validator,
      required super.controller,
      super.onChanged,
      super.obsecureText = true});
}
