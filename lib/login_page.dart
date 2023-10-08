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

  final TextEditingController _loginNameController = TextEditingController();
  final TextEditingController _loginPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginStatus = ref.watch(loginStatusProvider);
    final storage = ref.watch(storageHelperProvider.notifier).getStorageData();

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 100, 20, 0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomTitleText(title: "Password Vault"),
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
                    controller: _loginNameController,
                    title: "Name",
                    hint: "Enter Name",
                    validator: (value) =>
                        value!.isEmpty ? nullErrorMessage : null,
                  ),
                  PasswordTextInput(
                    controller: _loginPasswordController,
                    title: "Password",
                    hint: "Enter Password",
                    validator: (value) =>
                        value!.isEmpty ? nullErrorMessage : null,
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
                        ),
                      );
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
                      login(
                        context,
                        ref,
                        storage,
                        _loginPasswordController.text,
                        _loginNameController.text,
                      );
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

  void login(
      var context, var ref, var storage, var loginPassword, var loginName) {
    if (_formKey.currentState!.validate()) {
      storage.then(
        (data) {
          if (data.name != '') {
            if (data.password == loginPassword && data.name == loginName) {
              _formKey.currentState!.reset();
              ref.read(loginStatusProvider.notifier).update((state) => false);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const HomePage(),
                ),
                (route) => false,
              );
            } else {
              _formKey.currentState!.reset();
              ref.read(loginStatusProvider.notifier).update((state) => true);
            }
          } else {
            _formKey.currentState!.reset();
            ref.read(loginStatusProvider.notifier).update((state) => true);
          }
        },
      );
    }
  }
}
