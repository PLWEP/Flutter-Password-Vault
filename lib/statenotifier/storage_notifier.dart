import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pasword_vault/util/result_state.dart';

class StorageNotifier extends StateNotifier<StorageState> {
  final FlutterSecureStorage storageHelper;
  StorageNotifier({required this.storageHelper})
      : super(const StorageState.loading()) {
    _getStorageData();
  }

  void _getStorageData() async {
    state = const StorageState.loading();
    final name = await storageHelper.read(key: 'name');
    final password = await storageHelper.read(key: 'password');
    if (name != null && password != null) {
      state = StorageState.hasData(name, password);
    } else {
      state = const StorageState.noData('Not Found');
    }
  }

  void saveStorage(String name, String password) async {
    state = const StorageState.loading();
    await storageHelper.write(key: 'name', value: name);
    await storageHelper.write(key: 'password', value: password);
  }
}

class StorageState {
  final ResultState resultState;
  final String? name;
  final String? password;
  final String? message;

  const StorageState._({
    required this.resultState,
    this.name,
    this.password,
    this.message,
  });

  const StorageState.loading() : this._(resultState: ResultState.loading);

  const StorageState.hasData(
    String name,
    String password,
  ) : this._(
          resultState: ResultState.hasData,
          name: name,
          password: password,
        );

  const StorageState.noData(String message)
      : this._(resultState: ResultState.noData, message: message);

  const StorageState.error(String message)
      : this._(resultState: ResultState.error, message: message);
}
