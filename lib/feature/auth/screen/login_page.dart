import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pasword_vault/feature/auth/provider/auth_provider.dart';
import 'package:pasword_vault/feature/category/screen/home_page.dart';
import 'package:pasword_vault/model/user_model.dart';
import 'package:pasword_vault/common/global_variable.dart';
import 'package:pasword_vault/common/widget/custom_elevated_button.dart';
import 'package:pasword_vault/common/widget/custom_text_input.dart';
import 'package:pasword_vault/feature/auth/widget/custom_title_text.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _loginNameController = TextEditingController();
  final TextEditingController _loginPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _loginNameController.dispose();
    _loginPasswordController.dispose();
  }

  void login(UserModel user) {
    if (user.password == _loginPasswordController.text &&
        user.name == _loginNameController.text) {
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
  }

  @override
  Widget build(BuildContext context) {
    final loginStatus = ref.watch(loginStatusProvider);
    final user = ref.watch(userProvider)!;

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
                  if (loginStatus)
                    Container(
                      height: 40,
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
                  CustomElevatedButton(
                    title: "Login",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        login(user);
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
