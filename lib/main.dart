import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pasword_vault/common/widget/loader.dart';
import 'package:pasword_vault/feature/auth/provider/auth_provider.dart';
import 'package:pasword_vault/feature/auth/screen/login_page.dart';
import 'package:pasword_vault/feature/auth/screen/register_page.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(storageControllerProvider);
    final user = ref.watch(userProvider);
    return MaterialApp(
      home: isLoading
          ? const Scaffold(body: Loader())
          : user == null
              ? const RegisterPage()
              : const LoginPage(),
    );
  }
}
