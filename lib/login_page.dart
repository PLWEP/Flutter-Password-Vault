import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pasword_vault/home_page.dart';
import 'package:pasword_vault/register_page.dart';
import 'package:pasword_vault/util/global_variable.dart';
import 'package:pasword_vault/util/provider_variable.dart';
import 'package:pasword_vault/widget/custom_elevated_button.dart';
import 'package:pasword_vault/widget/custom_text_input.dart';
import 'package:pasword_vault/widget/custom_title_text.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginName = ref.watch(loginNameProvider);
    final loginPassword = ref.watch(loginPasswordProvider);
    final loginStatus = ref.watch(loginStatusProvider);
    final storage = ref.watch(storageHelperProvider.notifier).getStorageData();

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
                      title: "Password Vault",
                      textStyle: titleStyle,
                    ),
                    Container(
                      height: loginStatus ? 40 : 0,
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.red.shade200,
                        border: Border.all(
                          color: Colors.red,
                          width: loginStatus ? 3 : 0,
                        ),
                      ),
                      child: const Center(
                        child:
                            Text("Something Wrong. Incorrect password / name."),
                      ),
                    ),
                    CustomTextInput(
                      title: "Name",
                      hint: "Enter Name",
                      obsecureText: false,
                      validator: (value) =>
                          value!.isEmpty ? nullErrorMessage : null,
                      onChanged: (value) => ref
                          .read(loginNameProvider.notifier)
                          .update((state) => value),
                    ),
                    CustomTextInput(
                      title: "Password",
                      hint: "Enter Password",
                      obsecureText: true,
                      validator: (value) =>
                          value!.isEmpty ? nullErrorMessage : null,
                      onChanged: (value) => ref
                          .read(loginPasswordProvider.notifier)
                          .update((state) => value),
                    ),
                    GestureDetector(
                      onTap: () {
                        _formKey.currentState!.reset();
                        ref
                            .read(loginStatusProvider.notifier)
                            .update((state) => false);
                        Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => RegisterPage(),
                            ));
                      },
                      child: Container(
                        height: 20,
                        margin: const EdgeInsets.only(bottom: 5),
                        child: const Center(
                          child: Text(
                            "Need account? Click here",
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ),
                    CustomElevatedButton(
                      title: "Login",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          storage.then(
                            (data) {
                              if (data.name != '') {
                                if (data.password == loginPassword &&
                                    data.name == loginName) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          const HomePage(),
                                    ),
                                  );
                                } else {
                                  _formKey.currentState!.reset();
                                  ref
                                      .read(loginStatusProvider.notifier)
                                      .update((state) => true);
                                }
                              } else {
                                _formKey.currentState!.reset();
                                ref
                                    .read(loginStatusProvider.notifier)
                                    .update((state) => true);
                              }
                            },
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
