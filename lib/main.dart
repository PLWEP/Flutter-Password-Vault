import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pasword_vault/login_page.dart';
import 'package:pasword_vault/register_page.dart';
import 'package:pasword_vault/util/provider_variable.dart';
import 'package:pasword_vault/util/result_state.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(storageProvider);
    return MaterialApp(
      home: Builder(
        builder: (context) {
          if (result.resultState == ResultState.loading) {
            return const Scaffold(
              body: SafeArea(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          } else if (result.resultState == ResultState.hasData) {
            return const LoginPage();
          } else if (result.resultState == ResultState.noData) {
            return RegisterPage();
          } else {
            return const Scaffold(
              body: SafeArea(
                child: Center(
                  child: Text('Error found Try Again Later'),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
