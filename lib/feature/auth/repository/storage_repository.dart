import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pasword_vault/common/failure.dart';
import 'package:pasword_vault/common/typedef.dart';
import 'package:pasword_vault/model/user_model.dart';

class StorageRepository {
  final FlutterSecureStorage _storageHelper;

  StorageRepository({required FlutterSecureStorage storageHelper})
      : _storageHelper = storageHelper;

  getStorageData() async {
    try {
      final name = await _storageHelper.read(key: 'name');
      final password = await _storageHelper.read(key: 'password');

      final res = name == null && password == null
          ? null
          : UserModel(name: name!, password: password!);

      return right(res);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureVoid saveStorage(String name, String password) async {
    try {
      await _storageHelper.write(key: 'name', value: name);

      return right(
        await _storageHelper.write(key: 'password', value: password),
      );
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
