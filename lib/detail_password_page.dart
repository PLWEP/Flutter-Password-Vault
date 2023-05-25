import 'package:flutter/material.dart';
import 'package:pasword_vault/util/global_variable.dart';
import 'package:pasword_vault/widget/custom_detail_password_box.dart';
import 'package:pasword_vault/widget/custom_detail_username_box.dart';
import 'package:pasword_vault/widget/custom_title_text.dart';

class DetailPasswordPage extends StatelessWidget {
  final String title;
  final String username;
  final String password;
  const DetailPasswordPage(
      {super.key,
      required this.title,
      required this.username,
      required this.password});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 275,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTitleText(
            title: title,
            textStyle: heading1Style,
          ),
          CustomDetailUsernameBox(
            title: "Username",
            data: username,
          ),
          CustomDetailPasswordBox(
            title: "Password",
            data: password,
          )
        ],
      ),
    );
  }
}
