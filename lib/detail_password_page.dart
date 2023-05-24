import 'package:flutter/material.dart';
import 'package:pasword_vault/util/global_variable.dart';
import 'package:pasword_vault/widget/custom_detail_password_box.dart';
import 'package:pasword_vault/widget/custom_detail_username_box.dart';
import 'package:pasword_vault/widget/custom_title_text.dart';

class DetailPasswordPage extends StatelessWidget {
  const DetailPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 275,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTitleText(
            title: "SSH",
            textStyle: heading1Style,
          ),
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
