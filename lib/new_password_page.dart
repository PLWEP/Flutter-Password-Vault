import 'package:flutter/material.dart';
import 'package:pasword_vault/widget/custom_elevated_button.dart';
import 'package:pasword_vault/widget/custom_text_input.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  TextEditingController _judulController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _judulController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buat Password"),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextInput(
                title: "Judul",
                hint: "Enter judul",
                controller: _judulController,
              ),
              CustomTextInput(
                title: "Username",
                hint: "Enter username",
                controller: _judulController,
              ),
              CustomTextInput(
                title: "Password",
                hint: "Enter password",
                controller: _judulController,
              ),
              CustomTextInput(
                title: "ConfirmPassword",
                hint: "Enter confirm password",
                controller: _judulController,
              ),
              CustomElevatedButton(title: "Simpan", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
