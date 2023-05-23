import 'package:flutter/material.dart';

class CustomDetailUsernameBox extends StatelessWidget {
  final String title;
  final String data;
  const CustomDetailUsernameBox(
      {super.key, required this.title, required this.data});

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
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            margin: EdgeInsets.only(bottom: 15),
            child: Text(
              data,
              style: TextStyle(
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
