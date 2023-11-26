import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pasword_vault/feature/category/provider/category_provider.dart';
import 'package:pasword_vault/feature/password/controller/password_controller.dart';
import 'package:pasword_vault/feature/password/repository/password_repository.dart';

import 'package:pasword_vault/model/password_model.dart';

final passwordProvider = StateProvider<List<PasswordModel>>((ref) => []);
final selectedCategoryProvider = StateProvider<String?>((ref) => null);

final passwordControllerProvider =
    StateNotifierProvider<PasswordController, bool>(
  (ref) {
    final passwordRepository = ref.watch(passwordRepositoryProvider);
    return PasswordController(
      ref: ref,
      passwordRepository: passwordRepository,
    );
  },
);

final passwordRepositoryProvider = Provider(
  (ref) => PasswordRepository(
    databaseHelper: ref.watch(databaseHelperProvider),
  ),
);
