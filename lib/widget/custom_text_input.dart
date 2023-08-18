import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  final String title;
  final String hint;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final bool obsecureText;
  const CustomTextInput({
    super.key,
    required this.title,
    required this.hint,
    required this.validator,
    this.onChanged,
    required this.obsecureText,
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
