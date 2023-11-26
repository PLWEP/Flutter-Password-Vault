import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pasword_vault/feature/auth/provider/auth_provider.dart';
import 'package:pasword_vault/feature/auth/repository/storage_repository.dart';
import 'package:pasword_vault/common/widget/snackbar.dart';
import 'package:pasword_vault/feature/auth/screen/login_page.dart';

class StorageController extends StateNotifier<bool> {
  final Ref _ref;
  final StorageRepository _storageRepository;

  StorageController({
    required Ref ref,
    required StorageRepository storageRepository,
  })  : _storageRepository = storageRepository,
        _ref = ref,
        super(false);

  void getStorageData(BuildContext context) async {
    final res = await _storageRepository.getStorageData();

    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) => _ref.read(userProvider.notifier).update((state) => r),
    );
  }

  void saveStorageData(
    BuildContext context,
    String name,
    String password,
  ) async {
    final res = await _storageRepository.saveStorage(name, password);

    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) {
        showSnackBar(context, "Register successfully");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const LoginPage(),
          ),
        );
      },
    );
  }
}
