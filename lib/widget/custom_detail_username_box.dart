import 'package:flutter/material.dart';

class CustomDetailUsernameBox extends StatelessWidget {
  final String title;
  final String data;
  const CustomDetailUsernameBox(
      {super.key, required this.title, required this.data});

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
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            margin: const EdgeInsets.only(bottom: 15),
            child: Text(
              data,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
