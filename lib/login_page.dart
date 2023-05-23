import 'package:flutter/material.dart';
import 'package:pasword_vault/home_page.dart';
import 'package:pasword_vault/widget/custom_elevated_button.dart';
import 'package:pasword_vault/widget/custom_text_input.dart';
import 'package:pasword_vault/widget/custom_title_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTitleText(title: "Password Vault"),
              CustomTextInput(
                title: "Password",
                hint: "Enter Password",
                controller: _passwordController,
              ),
              CustomElevatedButton(
                  title: "Login",
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) => const HomePage()),
                      ModalRoute.withName('/'),
                    );
                  }),
            ],
          ),
        ),
      )),
    );
  }
}
