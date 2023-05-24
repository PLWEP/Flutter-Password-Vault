import 'package:flutter/material.dart';
import 'package:pasword_vault/login_page.dart';
import 'package:pasword_vault/util/global_variable.dart';
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

  bool _nameStatus = true;
  bool _passwordStatus = true;
  bool _confirmPasswordStatus = true;

  String _confirmPasswordErrorMessage = '';

  void registerSubmit(String name, String password, String confirmPassword) {
    if (name.isEmpty) {
      setState(() {
        _nameStatus = false;
      });
    } else {
      setState(() {
        _nameStatus = true;
      });
    }
    if (password.isEmpty) {
      setState(() {
        _passwordStatus = false;
      });
    } else {
      setState(() {
        _passwordStatus = true;
      });
    }
    if (confirmPassword.isEmpty) {
      setState(() {
        _confirmPasswordStatus = false;
        _confirmPasswordErrorMessage = nullErrorMessage;
      });
    } else {
      if (password != confirmPassword) {
        setState(() {
          _confirmPasswordStatus = false;
          _confirmPasswordErrorMessage = notSameErrorMessage;
        });
      } else {
        setState(() {
          _confirmPasswordStatus = true;
        });
      }
    }
  }

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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTitleText(
                    title: "Register",
                    textStyle: titleStyle,
                  ),
                  CustomTextInput(
                    title: "Name",
                    hint: "Enter name",
                    controller: _nameController,
                    validate: _nameStatus,
                    errorMessage: nullErrorMessage,
                  ),
                  CustomTextInput(
                    title: "Password",
                    hint: "Enter password",
                    controller: _passwordController,
                    validate: _passwordStatus,
                    errorMessage: nullErrorMessage,
                  ),
                  CustomTextInput(
                    title: "Confirm Password",
                    hint: "Enter confirm password",
                    controller: _confirmPasswordController,
                    validate: _confirmPasswordStatus,
                    errorMessage: _confirmPasswordErrorMessage,
                  ),
                  CustomElevatedButton(
                      title: "Register",
                      onPressed: () {
                        registerSubmit(
                          _nameController.text,
                          _passwordController.text,
                          _confirmPasswordController.text,
                        );
                        if (_nameStatus &&
                            _passwordStatus &&
                            _confirmPasswordStatus) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const LoginPage()),
                          );
                        }
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
