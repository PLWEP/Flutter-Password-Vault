import 'package:flutter/material.dart';
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextInput(
                title: "Title",
                hint: "Enter title",
                controller: _titleController,
              ),
              CustomTextInput(
                title: "Username",
                hint: "Enter username",
                controller: _titleController,
              ),
              CustomTextInput(
                title: "Password",
                hint: "Enter password",
                controller: _titleController,
              ),
              CustomTextInput(
                title: "ConfirmPassword",
                hint: "Enter confirm password",
                controller: _titleController,
              ),
              CustomElevatedButton(title: "Save", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
