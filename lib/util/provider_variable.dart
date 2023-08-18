import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pasword_vault/statenotifier/category_notifier.dart';
import 'package:pasword_vault/statenotifier/encrypt_notifier.dart';
import 'package:pasword_vault/statenotifier/password_notifier.dart';
import 'package:pasword_vault/statenotifier/storage_notifier.dart';
import 'package:pasword_vault/util/database_helper.dart';

// register
final registerNameProvider = StateProvider<String>((ref) => '');
final registerPasswordProvider = StateProvider<String>((ref) => '');
final registerConfirmPasswordProvider =
    StateProvider.autoDispose<String>((ref) => '');

// login
final loginStatusProvider = StateProvider.autoDispose<bool>((ref) => false);
final loginPasswordProvider = StateProvider.autoDispose<String>((ref) => '');
final loginNameProvider = StateProvider.autoDispose<String>((ref) => '');
final getAccountLoginProvider = FutureProvider((ref) {
  final databaseHelper = ref.read(databaseHelperProvider);
  final name = ref.read(loginNameProvider);
  return databaseHelper.getAccount(name);
});

// new password
final titleProvider = StateProvider<String>((ref) => '');
final usernameProvider = StateProvider<String>((ref) => '');
final passwordProvider = StateProvider<String>((ref) => '');
final confirmPasswordProvider = StateProvider<String>((ref) => '');

// home

// category
final categoryPageProvider = StateProvider.autoDispose<String>((ref) => '');

final categoryDumbProvider = StateProvider<String>((ref) => '');

// detail password
final passwordVisibilityProvider =
    StateProvider.autoDispose<bool>((ref) => false);

// storage
final storageHelperProvider =
    StateProvider((ref) => const FlutterSecureStorage());
final storageProvider =
    StateNotifierProvider<StorageNotifier, StorageState>((ref) {
  final storageHelper = ref.watch(storageHelperProvider);
  return StorageNotifier(storageHelper: storageHelper);
});

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
