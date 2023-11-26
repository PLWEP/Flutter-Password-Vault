import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pasword_vault/feature/password/provider/password_provider.dart';
import 'package:pasword_vault/model/password_model.dart';
import 'package:pasword_vault/common/global_variable.dart';
import 'package:pasword_vault/common/provider_variable.dart';
import 'package:pasword_vault/widget/custom_elevated_button.dart';
import 'package:pasword_vault/widget/custom_text_input.dart';

class AddPasswordPage extends ConsumerStatefulWidget {
  const AddPasswordPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddPasswordPageState();
}

class _AddPasswordPageState extends ConsumerState<AddPasswordPage> {
  void onSubmit() {
    final encryptedPassword = ref
        .read(encryptProvider)
        .encryptMessage(_passwordController.text.trim());
    final date = DateFormat('EEEE MMMM y').format(DateTime.now());
    ref.read(passwordControllerProvider.notifier).addPassword(
          context,
          PasswordModel(
            title: _titleController.text.trim(),
            username: _usernameController.text.trim(),
            password: encryptedPassword.data,
            byte: encryptedPassword.byte,
            date: date,
            category: ref.read(selectedCategoryProvider)!,
          ),
        );
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  final _formKey = GlobalKey<FormState>();
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
                        onSubmit();
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
