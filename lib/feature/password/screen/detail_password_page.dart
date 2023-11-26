import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pasword_vault/feature/password/widget/custom_detail_password_box.dart';
import 'package:pasword_vault/feature/password/widget/custom_detail_username_box.dart';

class DetailPasswordPage extends StatelessWidget {
  final String title;
  final String username;
  final String password;
  final Uint8List byte;
  const DetailPasswordPage({
    super.key,
    required this.title,
    required this.username,
    required this.password,
    required this.byte,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomDetailUsernameBox(
            data: username,
          ),
          CustomDetailPasswordBox(
            data: byte,
            password: password,
          )
        ],
      ),
    );
  }
}
