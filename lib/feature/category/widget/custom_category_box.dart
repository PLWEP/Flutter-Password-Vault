import 'package:flutter/material.dart';

class CustomCategoryBox extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() onpressed;
  const CustomCategoryBox({
    super.key,
    required this.title,
    required this.icon,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        margin: const EdgeInsets.only(bottom: 15),
        width: double.infinity,
        height: 75,
        decoration: const BoxDecoration(color: Colors.black26),
        child: Row(
          children: [
            Icon(icon, size: 40),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
