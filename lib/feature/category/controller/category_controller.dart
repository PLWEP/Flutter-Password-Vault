import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pasword_vault/common/widget/snackbar.dart';
import 'package:pasword_vault/feature/category/provider/category_provider.dart';
import 'package:pasword_vault/feature/category/repository/category_repository.dart';
import 'package:pasword_vault/model/category_model.dart';

class CategoryController extends StateNotifier<bool> {
  final Ref _ref;
  final CategoryRepository _categoryRepository;

  CategoryController({
    required Ref ref,
    required CategoryRepository categoryRepository,
  })  : _categoryRepository = categoryRepository,
        _ref = ref,
        super(false) {
    getCategory();
  }

  void getCategory() async {
    state = true;
    final res = await _categoryRepository.getCategory();
    _ref.read(categoryProvider.notifier).update((state) => res);
    state = false;
  }

  void addCategory(
    BuildContext context,
    String title,
  ) async {
    state = true;
    final res =
        await _categoryRepository.addCategory(CategoryModel(title: title));
    getCategory();
    state = false;
    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) {
        showSnackBar(context, "Add Category successfully");
        Navigator.pop(context);
      },
    );
  }
}
