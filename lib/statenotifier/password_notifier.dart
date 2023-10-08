import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pasword_vault/model/password_model.dart';
import 'package:pasword_vault/util/database_helper.dart';
import 'package:pasword_vault/util/global_variable.dart';

class PasswordNotifier extends StateNotifier<PasswordState> {
  final DatabaseHelper databaseHelper;
  final String category;

  PasswordNotifier({required this.databaseHelper, required this.category})
      : super(const PasswordState.loading()) {
    _getPassword();
  }

  void _getPassword() async {
    state = const PasswordState.loading();
    final password = await databaseHelper.getPassword(category);
    if (password.isNotEmpty) {
      state = PasswordState.hasData(password);
    } else {
      state = const PasswordState.noData('No Password Found');
    }
  }

  Future<void> addPassword(PasswordModel passwordModel) async {
    try {
      await databaseHelper.insertPassword(passwordModel);
      _getPassword();
    } catch (e) {
      state = PasswordState.error('Error Found: $e');
    }
  }
}

class PasswordState {
  final ResultState resultState;
  final List<PasswordModel>? passwords;
  final String? message;

  const PasswordState._({
    required this.resultState,
    this.message,
    this.passwords,
  });

  const PasswordState.loading() : this._(resultState: ResultState.loading);

  const PasswordState.hasData(
    List<PasswordModel>? passwords,
  ) : this._(
          resultState: ResultState.hasData,
          passwords: passwords,
        );

  const PasswordState.noData(String message)
      : this._(resultState: ResultState.noData, message: message);

  const PasswordState.error(String message)
      : this._(resultState: ResultState.error, message: message);
}
