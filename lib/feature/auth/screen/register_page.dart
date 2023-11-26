import 'package:flutter/material.dart';
import 'package:pasword_vault/feature/auth/provider/auth_provider.dart';
import 'package:pasword_vault/common/global_variable.dart';
import 'package:pasword_vault/widget/custom_elevated_button.dart';
import 'package:pasword_vault/widget/custom_text_input.dart';
import 'package:pasword_vault/widget/custom_title_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final TextEditingController _registerNameController = TextEditingController();
  final TextEditingController _registerPasswordController =
      TextEditingController();
  final TextEditingController _registerConfirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _registerNameController.dispose();
    _registerPasswordController.dispose();
    _registerConfirmPasswordController.dispose();
  }

  void register() =>
      ref.read(storageControllerProvider.notifier).saveStorageData(
            context,
            _registerNameController.text.trim(),
            _registerPasswordController.text.trim(),
          );

  @override
  Widget build(BuildContext context) {
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
                      controller: _registerNameController,
                      title: "Name",
                      hint: "Enter name",
                      validator: (value) =>
                          value!.isEmpty ? nullErrorMessage : null,
                    ),
                    PasswordTextInput(
                      controller: _registerPasswordController,
                      title: "Password",
                      hint: "Enter password",
                      validator: (value) =>
                          value!.isEmpty ? nullErrorMessage : null,
                    ),
                    PasswordTextInput(
                      controller: _registerConfirmPasswordController,
                      title: "Confirm Password",
                      hint: "Enter confirm password",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return nullErrorMessage;
                        } else if (_registerPasswordController.text !=
                            _registerConfirmPasswordController.text) {
                          return notSameErrorMessage;
                        } else {
                          return null;
                        }
                      },
                    ),
                    CustomElevatedButton(
                      title: "Register",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          register();
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
