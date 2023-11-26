import 'package:fpdart/fpdart.dart';
import 'package:pasword_vault/common/failure.dart';
import 'package:pasword_vault/common/typedef.dart';
import 'package:pasword_vault/model/password_model.dart';
import 'package:pasword_vault/common/database_helper.dart';

class PasswordRepository {
  final DatabaseHelper _databaseHelper;

  PasswordRepository({required DatabaseHelper databaseHelper})
      : _databaseHelper = databaseHelper;

  Future<List<PasswordModel>> getPassword(String category) async {
    final password = await _databaseHelper.getPassword(category);

    return password.isEmpty ? [] : password;
  }

  FutureVoid addPassword(PasswordModel passwordModel) async {
    try {
      return right(await _databaseHelper.insertPassword(passwordModel));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
