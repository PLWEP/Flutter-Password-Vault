import 'package:riverpod/riverpod.dart';

// register
final registerNameProvider = StateProvider.autoDispose<String>((ref) => '');
final registerPasswordProvider = StateProvider.autoDispose<String>((ref) => '');
final registerConfirmPasswordProvider =
    StateProvider.autoDispose<String>((ref) => '');
