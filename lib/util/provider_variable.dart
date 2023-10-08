import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:pasword_vault/statenotifier/category_notifier.dart';
import 'package:pasword_vault/statenotifier/encrypt_notifier.dart';
import 'package:pasword_vault/statenotifier/password_notifier.dart';
import 'package:pasword_vault/statenotifier/storage_notifier.dart';
import 'package:pasword_vault/util/database_helper.dart';

// login
final loginStatusProvider = StateProvider.autoDispose<bool>((ref) => false);

// category
final categoryPageProvider = StateProvider.autoDispose<String>((ref) => '');

// detail password
final passwordVisibilityProvider =
    StateProvider.autoDispose<bool>((ref) => false);

// Database
final databaseHelperProvider = StateProvider<DatabaseHelper>((ref) {
  return DatabaseHelper();
});

final databaseCategoryProvider =
    StateNotifierProvider.autoDispose<CategoryNotifier, CategoryState>((ref) {
  final databaseHelper = ref.watch(databaseHelperProvider);
  return CategoryNotifier(databaseHelper: databaseHelper);
});

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

// storage
final storageHelperProvider = StateNotifierProvider((ref) {
  return StorageNotifier(storageHelper: const FlutterSecureStorage());
});
