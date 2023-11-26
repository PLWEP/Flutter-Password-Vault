import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pasword_vault/feature/category/controller/category_controller.dart';
import 'package:pasword_vault/feature/category/repository/category_repository.dart';
import 'package:pasword_vault/model/category_model.dart';
import 'package:pasword_vault/common/provider_variable.dart';

final categoryProvider = StateProvider<List<CategoryModel>>((ref) => []);

final categoryControllerProvider =
    StateNotifierProvider<CategoryController, bool>(
  (ref) {
    final categoryRepository = ref.watch(categoryRepositoryProvider);
    return CategoryController(
      ref: ref,
      categoryRepository: categoryRepository,
    );
  },
);

final categoryRepositoryProvider = Provider(
  (ref) => CategoryRepository(
    databaseHelper: ref.watch(databaseHelperProvider),
  ),
);
