import 'package:flutter/material.dart';

class CustomDetailPasswordBox extends StatelessWidget {
  final String title;
  final String data;
  const CustomDetailPasswordBox(
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
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  "password",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                )),
                Icon(Icons.copy),
                SizedBox(width: 5),
                Icon(Icons.remove_red_eye),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
