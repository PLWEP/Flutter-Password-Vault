import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pasword_vault/statenotifier/database_notifier.dart';
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

// Database
final databaseHelperProvider = Provider.autoDispose<DatabaseHelper>((ref) {
  return DatabaseHelper();
});
final databaseProvider =
    StateNotifierProvider.autoDispose<DatabaseProvider, DatabaseState>((ref) {
  final databaseHelper = ref.watch(databaseHelperProvider);
  return DatabaseProvider(databaseHelper: databaseHelper);
});
