import 'package:flutter/material.dart';
import 'package:pasword_vault/home_page.dart';
import 'package:pasword_vault/util/global_variable.dart';
import 'package:pasword_vault/widget/custom_elevated_button.dart';
import 'package:pasword_vault/widget/custom_text_input.dart';
import 'package:pasword_vault/widget/custom_title_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _passwordController = TextEditingController();

  bool _passwordStatus = true;

  void loginSubmit(String password) {
    if (password.isEmpty) {
      setState(() {
        _passwordStatus = false;
      });
    } else {
      setState(() {
        _passwordStatus = true;
      });
    }
  }

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
          margin: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTitleText(
                  title: "Password Vault",
                  textStyle: titleStyle,
                ),
                CustomTextInput(
                  title: "Password",
                  hint: "Enter Password",
                  controller: _passwordController,
                  validate: _passwordStatus,
                  errorMessage: nullErrorMessage,
                ),
                CustomElevatedButton(
                  title: "Login",
                  onPressed: () {
                    loginSubmit(_passwordController.text);
                    if (_passwordStatus) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const HomePage()),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
