import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pasword_vault/home_page.dart';
import 'package:pasword_vault/util/global_variable.dart';
import 'package:pasword_vault/util/provider_variable.dart';
import 'package:pasword_vault/widget/custom_elevated_button.dart';
import 'package:pasword_vault/widget/custom_text_input.dart';
import 'package:pasword_vault/widget/custom_title_text.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String passwordStorage = "";

  @override
  void initState() {
    ref.read(storageProvider.notifier).getPassword().then((value) {
      setState(() {
        passwordStorage = value!;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loginPassword = ref.watch(loginPasswordProvider);
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
                    CustomTextInput(
                      title: "Password",
                      hint: "Enter Password",
                      validator: (value) =>
                          value!.isEmpty ? nullErrorMessage : null,
                      onChanged: (value) => ref
                          .read(loginPasswordProvider.notifier)
                          .update((state) => value),
                    ),
                    CustomElevatedButton(
                      title: "Login",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (passwordStorage == loginPassword) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const HomePage(),
                              ),
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                content: const Text("Wrong Password"),
                                actions: <Widget>[
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      fixedSize: MaterialStateProperty.all(
                                        const Size(double.maxFinite, 50),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Close"),
                                  ),
                                ],
                              ),
                            );
                          }
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
