import 'package:flutter/material.dart';
import 'package:pasword_vault/widget/custom_detail_password_box.dart';
import 'package:pasword_vault/widget/custom_detail_username_box.dart';
import 'package:pasword_vault/widget/custom_heading1_text.dart';

class DetailPasswordPage extends StatelessWidget {
  const DetailPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 275,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomHeading1Text(title: "SSH"),
          CustomDetailUsernameBox(
            title: "Username",
            data: "username",
          ),
          CustomDetailPasswordBox(
            title: "Password",
            data: "Password",
          )
        ],
      ),
    );
  }
}
