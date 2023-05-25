import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pasword_vault/statenotifier/category_notifier.dart';
import 'package:pasword_vault/statenotifier/password_notifier.dart';
import 'package:pasword_vault/util/database_helper.dart';

// register
final registerNameProvider = StateProvider.autoDispose<String>((ref) => '');
final registerPasswordProvider = StateProvider.autoDispose<String>((ref) => '');
final registerConfirmPasswordProvider =
    StateProvider.autoDispose<String>((ref) => '');

// login
final loginPasswordProvider = StateProvider.autoDispose<String>((ref) => '');

// new password
final titleProvider = StateProvider.autoDispose<String>((ref) => '');
final usernameProvider = StateProvider.autoDispose<String>((ref) => '');
final passwordProvider = StateProvider.autoDispose<String>((ref) => '');
final confirmPasswordProvider = StateProvider.autoDispose<String>((ref) => '');

// home
final categoryProvider = StateProvider<String>((ref) => '');

// category
final categoryPageProvider = StateProvider.autoDispose<String>((ref) => '');

// Database
final databaseHelperProvider = Provider.autoDispose<DatabaseHelper>((ref) {
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
