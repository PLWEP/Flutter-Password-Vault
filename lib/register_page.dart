import 'package:flutter/material.dart';
import 'package:pasword_vault/login_page.dart';
import 'package:pasword_vault/widget/custom_elevated_button.dart';
import 'package:pasword_vault/widget/custom_text_input.dart';
import 'package:pasword_vault/widget/custom_title_text.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomTitleText(title: "Register"),
                CustomTextInput(
                  title: "Name",
                  hint: "Enter name",
                  controller: _nameController,
                ),
                CustomTextInput(
                  title: "Password",
                  hint: "Enter password",
                  controller: _passwordController,
                ),
                CustomTextInput(
                  title: "Confirm Password",
                  hint: "Enter confirm password",
                  controller: _confirmPasswordController,
                ),
                CustomElevatedButton(
                    title: "Register",
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const LoginPage()),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
