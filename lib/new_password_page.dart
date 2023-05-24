import 'package:flutter/material.dart';
import 'package:pasword_vault/util/global_variable.dart';
import 'package:pasword_vault/widget/custom_elevated_button.dart';
import 'package:pasword_vault/widget/custom_text_input.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _titleStatus = true;
  bool _usernameStatus = true;
  bool _passwordStatus = true;
  bool _confirmPasswordStatus = true;

  String _confirmPasswordErrorMessage = '';

  void saveSubmit(
      String title, String username, String password, String confirmPassword) {
    if (title.isEmpty) {
      setState(() {
        _titleStatus = false;
      });
    } else {
      setState(() {
        _titleStatus = true;
      });
    }
    if (username.isEmpty) {
      setState(() {
        _usernameStatus = false;
      });
    } else {
      setState(() {
        _usernameStatus = true;
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
    _titleController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Password"),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextInput(
                  title: "Title",
                  hint: "Enter title",
                  controller: _titleController,
                  validate: _titleStatus,
                  errorMessage: nullErrorMessage,
                ),
                CustomTextInput(
                  title: "Username",
                  hint: "Enter username",
                  controller: _usernameController,
                  validate: _usernameStatus,
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
                  title: "ConfirmPassword",
                  hint: "Enter confirm password",
                  controller: _confirmPasswordController,
                  validate: _confirmPasswordStatus,
                  errorMessage: _confirmPasswordErrorMessage,
                ),
                CustomElevatedButton(
                    title: "Save",
                    onPressed: () {
                      saveSubmit(
                          _titleController.text,
                          _usernameController.text,
                          _passwordController.text,
                          _confirmPasswordController.text);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
