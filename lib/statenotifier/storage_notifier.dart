import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pasword_vault/model/storage_model.dart';

class StorageNotifier extends StateNotifier<String> {
  final FlutterSecureStorage storageHelper;
  StorageNotifier({required this.storageHelper}) : super('');

  Future<StorageModel> getStorageData() async {
    final name = await storageHelper.read(key: 'name');
    final password = await storageHelper.read(key: 'password');
    debugPrint(name);
    debugPrint(password);
    if (name != null && password != null) {
      return StorageModel(name: name, password: password);
    } else {
      return StorageModel(name: "", password: "");
    }
  }

  Future<void> saveStorage(String name, String password) async {
    await storageHelper.write(key: 'name', value: name);
    await storageHelper.write(key: 'password', value: password);
  }
}
