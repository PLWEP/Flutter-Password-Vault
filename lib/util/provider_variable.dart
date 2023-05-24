import 'package:flutter_riverpod/flutter_riverpod.dart';

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
