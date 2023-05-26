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

  final _formKey = GlobalKey<FormState>();

  void onSubmit(WidgetRef ref) {
    final name = ref.read(registerNameProvider);
    final password = ref.read(registerPasswordProvider);
    ref.read(storageProvider.notifier).saveStorage(name, password);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final password = ref.watch(registerPasswordProvider);
    final confirmPassword = ref.watch(registerConfirmPasswordProvider);
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
                    CustomTitleText(
                      title: "Register",
                      textStyle: titleStyle,
                    ),
                    CustomTextInput(
                      title: "Name",
                      hint: "Enter name",
                      validator: (value) =>
                          value!.isEmpty ? nullErrorMessage : null,
                      onChanged: (value) => ref
                          .read(registerNameProvider.notifier)
                          .update((state) => value),
                    ),
                    CustomTextInput(
                      title: "Password",
                      hint: "Enter password",
                      validator: (value) =>
                          value!.isEmpty ? nullErrorMessage : null,
                      onChanged: (value) => ref
                          .read(registerPasswordProvider.notifier)
                          .update((state) => value),
                    ),
                    CustomTextInput(
                      title: "Confirm Password",
                      hint: "Enter confirm password",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return nullErrorMessage;
                        } else if (password != confirmPassword) {
                          return notSameErrorMessage;
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) => ref
                          .read(registerConfirmPasswordProvider.notifier)
                          .update((state) => value),
                    ),
                    CustomElevatedButton(
                      title: "Register",
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          onSubmit(ref);
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
