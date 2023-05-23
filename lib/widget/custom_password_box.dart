import 'package:flutter/material.dart';

class CustomPasswordBox extends StatelessWidget {
  final String title;
  final String date;
  final Function() onpressed;
  const CustomPasswordBox(
      {super.key,
      required this.title,
      required this.date,
      required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        width: double.infinity,
        height: 75,
        decoration: BoxDecoration(
          color: Colors.black26,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                date,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
