import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pasword_vault/common/widget/snackbar.dart';
import 'package:pasword_vault/feature/password/provider/password_provider.dart';
import 'package:pasword_vault/feature/password/repository/password_repository.dart';

import 'package:pasword_vault/model/password_model.dart';

class PasswordController extends StateNotifier<bool> {
  final Ref _ref;
  final PasswordRepository _passwordRepository;

  PasswordController({
    required Ref ref,
    required PasswordRepository passwordRepository,
  })  : _passwordRepository = passwordRepository,
        _ref = ref,
        super(false) {
    getPassword();
  }

  void getPassword() async {
    state = true;
    final selectedCategory = _ref.watch(selectedCategoryProvider)!;
    final res = await _passwordRepository.getPassword(selectedCategory);
    _ref.read(passwordProvider.notifier).update((state) => res);
    state = false;
  }

  void addPassword(
    BuildContext context,
    PasswordModel passwordModel,
  ) async {
    state = true;
    final res = await _passwordRepository.addPassword(passwordModel);
    getPassword();
    state = false;
    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) {
        showSnackBar(context, "Add Password successfully");
        Navigator.pop(context);
      },
    );
  }
}
