import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pasword_vault/model/password_model.dart';
import 'package:pasword_vault/util/global_variable.dart';
import 'package:pasword_vault/util/provider_variable.dart';
import 'package:pasword_vault/widget/custom_elevated_button.dart';
import 'package:pasword_vault/widget/custom_text_input.dart';

class AddPasswordPage extends ConsumerWidget {
  final String category;
  AddPasswordPage({super.key, required this.category});

  void onSubmit(WidgetRef ref, String title, String username, String password) {
    final encryptedPassword =
        ref.read(encryptProvider.notifier).encryptMessage(password);
    final date = DateFormat('EEEE MMMM y').format(DateTime.now());
    ref.read(databasePasswordProvider.notifier).addPassword(
          PasswordModel(
            title: title,
            username: username,
            password: encryptedPassword.data,
            byte: encryptedPassword.byte,
            date: date,
            category: category,
          ),
        );
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Password"),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextInput(
                    controller: _titleController,
                    title: "Title",
                    hint: "Enter title",
                    validator: (value) =>
                        value!.isEmpty ? nullErrorMessage : null,
                  ),
                  CustomTextInput(
                    controller: _usernameController,
                    title: "Username",
                    hint: "Enter username",
                    validator: (value) =>
                        value!.isEmpty ? nullErrorMessage : null,
                  ),
                  PasswordTextInput(
                    controller: _passwordController,
                    title: "Password",
                    hint: "Enter password",
                    validator: (value) =>
                        value!.isEmpty ? nullErrorMessage : null,
                  ),
                  PasswordTextInput(
                    controller: _confirmPasswordController,
                    title: "ConfirmPassword",
                    hint: "Enter confirm password",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return nullErrorMessage;
                      } else if (_passwordController.text !=
                          _confirmPasswordController.text) {
                        return notSameErrorMessage;
                      } else {
                        return null;
                      }
                    },
                  ),
                  CustomElevatedButton(
                    title: "Save",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        onSubmit(
                          ref,
                          _titleController.text,
                          _usernameController.text,
                          _passwordController.text,
                        );
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
