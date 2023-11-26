import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pasword_vault/feature/auth/provider/auth_provider.dart';
import 'package:pasword_vault/feature/auth/screen/login_page.dart';
import 'package:pasword_vault/feature/auth/screen/register_page.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  @override
  void initState() {
    super.initState();
    ref.read(storageControllerProvider.notifier).getStorageData(context);
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    return MaterialApp(
      home: user == null ? const RegisterPage() : const LoginPage(),
    );
  }
}
