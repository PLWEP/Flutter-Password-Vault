import 'package:flutter/material.dart';

class CustomCategoryBox extends StatelessWidget {
  final String title;
  final IconData icon;
  const CustomCategoryBox({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      margin: EdgeInsets.only(bottom: 15),
      width: double.infinity,
      height: 75,
      decoration: BoxDecoration(
        color: Colors.black26,
      ),
      child: Row(
        children: [
          Icon(icon, size: 40),
          SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
