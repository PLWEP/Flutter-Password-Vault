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
  void onSubmit(WidgetRef ref) {
    final title = ref.read(titleProvider);
    final username = ref.read(usernameProvider);
    final password = ref.read(passwordProvider);
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

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final password = ref.watch(passwordProvider);
    final confirmPassword = ref.watch(confirmPasswordProvider);
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
                  // CustomTextInput(
                  //   title: "Title",
                  //   hint: "Enter title",
                  //   validator: (value) =>
                  //       value!.isEmpty ? nullErrorMessage : null,
                  //   onChanged: (value) => ref
                  //       .read(titleProvider.notifier)
                  //       .update((state) => value),
                  // ),
                  // CustomTextInput(
                  //   title: "Username",
                  //   hint: "Enter username",
                  //   validator: (value) =>
                  //       value!.isEmpty ? nullErrorMessage : null,
                  //   onChanged: (value) => ref
                  //       .read(usernameProvider.notifier)
                  //       .update((state) => value),
                  // ),
                  // PasswordTextInput(
                  //   title: "Password",
                  //   hint: "Enter password",
                  //   validator: (value) =>
                  //       value!.isEmpty ? nullErrorMessage : null,
                  //   onChanged: (value) => ref
                  //       .read(passwordProvider.notifier)
                  //       .update((state) => value),
                  // ),
                  // PasswordTextInput(
                  //   title: "ConfirmPassword",
                  //   hint: "Enter confirm password",
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return nullErrorMessage;
                  //     } else if (password != confirmPassword) {
                  //       return notSameErrorMessage;
                  //     } else {
                  //       return null;
                  //     }
                  //   },
                  //   onChanged: (value) => ref
                  //       .read(confirmPasswordProvider.notifier)
                  //       .update((state) => value),
                  // ),
                  CustomElevatedButton(
                    title: "Save",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        onSubmit(ref);
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
