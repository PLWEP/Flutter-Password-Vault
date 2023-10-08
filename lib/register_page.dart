import 'package:flutter/material.dart';
import 'package:pasword_vault/login_page.dart';
import 'package:pasword_vault/util/global_variable.dart';
import 'package:pasword_vault/util/provider_variable.dart';
import 'package:pasword_vault/widget/custom_elevated_button.dart';
import 'package:pasword_vault/widget/custom_text_input.dart';
import 'package:pasword_vault/widget/custom_title_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterPage extends ConsumerWidget {
  RegisterPage({super.key});

  final TextEditingController _loginNameController = TextEditingController();
  final TextEditingController _loginPasswordController =
      TextEditingController();
  final TextEditingController _loginConfirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomTitleText(title: "Register"),
                    CustomTextInput(
                      controller: _loginNameController,
                      title: "Name",
                      hint: "Enter name",
                      validator: (value) =>
                          value!.isEmpty ? nullErrorMessage : null,
                    ),
                    PasswordTextInput(
                      controller: _loginPasswordController,
                      title: "Password",
                      hint: "Enter password",
                      validator: (value) =>
                          value!.isEmpty ? nullErrorMessage : null,
                    ),
                    PasswordTextInput(
                      controller: _loginConfirmPasswordController,
                      title: "Confirm Password",
                      hint: "Enter confirm password",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return nullErrorMessage;
                        } else if (_loginPasswordController.text !=
                            _loginConfirmPasswordController.text) {
                          return notSameErrorMessage;
                        } else {
                          return null;
                        }
                      },
                    ),
                    CustomElevatedButton(
                      title: "Register",
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          ref.read(storageHelperProvider.notifier).saveStorage(
                              _loginNameController.text,
                              _loginPasswordController.text);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => LoginPage(),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
