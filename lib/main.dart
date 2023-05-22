import 'package:flutter/material.dart';
import 'package:pasword_vault/new_password_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: NewPasswordPage(),
      ),
    );
  }
}
