import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pasword_vault/feature/category/provider/category_provider.dart';

import 'package:pasword_vault/statenotifier/encrypt_notifier.dart';
import 'package:pasword_vault/statenotifier/password_notifier.dart';

// category
final categoryPageProvider = StateProvider.autoDispose<String>((ref) => '');

// detail password
final passwordVisibilityProvider =
    StateProvider.autoDispose<bool>((ref) => false);

// Database

final databasePasswordProvider =
    StateNotifierProvider.autoDispose<PasswordNotifier, PasswordState>((ref) {
  final databaseHelper = ref.watch(databaseHelperProvider);
  final categoryPage = ref.watch(categoryPageProvider);
  return PasswordNotifier(
    databaseHelper: databaseHelper,
    category: categoryPage,
  );
});

// encrypt
final encryptProvider = StateNotifierProvider.autoDispose((ref) {
  return EncryptNotifier();
});
