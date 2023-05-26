import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pasword_vault/statenotifier/category_notifier.dart';
import 'package:pasword_vault/statenotifier/password_notifier.dart';
import 'package:pasword_vault/statenotifier/storage_notifier.dart';
import 'package:pasword_vault/util/database_helper.dart';

// register
final registerNameProvider = StateProvider<String>((ref) => '');
final registerPasswordProvider = StateProvider<String>((ref) => '');
final registerConfirmPasswordProvider =
    StateProvider.autoDispose<String>((ref) => '');

// login
final loginPasswordProvider = StateProvider.autoDispose<String>((ref) => '');

// new password
final titleProvider = StateProvider<String>((ref) => '');
final usernameProvider = StateProvider<String>((ref) => '');
final passwordProvider = StateProvider<String>((ref) => '');
final confirmPasswordProvider = StateProvider<String>((ref) => '');

// home
final categoryProvider = StateProvider<String>((ref) => '');

// category
final categoryPageProvider = StateProvider.autoDispose<String>((ref) => '');

// detail password
final passwordVisibilityProvider =
    StateProvider.autoDispose<bool>((ref) => false);

// storage
final storageHelperProvider =
    StateProvider.autoDispose((ref) => const FlutterSecureStorage());
final storageProvider =
    StateNotifierProvider.autoDispose<StorageNotifier, StorageState>((ref) {
  final storageHelper = ref.watch(storageHelperProvider);
  return StorageNotifier(storageHelper: storageHelper);
});

// Database
final databaseHelperProvider = StateProvider.autoDispose<DatabaseHelper>((ref) {
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
