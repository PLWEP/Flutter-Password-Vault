import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pasword_vault/model/category_model.dart';
import 'package:pasword_vault/util/database_helper.dart';
import 'package:pasword_vault/util/result_state.dart';

class CategoryNotifier extends StateNotifier<CategoryState> {
  final DatabaseHelper databaseHelper;

  CategoryNotifier({required this.databaseHelper})
      : super(const CategoryState.loading()) {
    _getCategory();
  }

  void _getCategory() async {
    state = const CategoryState.loading();
    final category = await databaseHelper.getCategory();
    if (category.isNotEmpty) {
      state = CategoryState.hasData(category);
    } else {
      state = const CategoryState.noData('No Category Found');
    }
  }

  Future<void> addCategory(String categoryTitle) async {
    try {
      await databaseHelper.insertCategory(categoryTitle);
      _getCategory();
    } catch (e) {
      state = CategoryState.error('Error Found: $e');
    }
  }
}

class CategoryState {
  final ResultState resultState;
  final List<CategoryModel>? categories;
  final String? message;

  const CategoryState._({
    required this.resultState,
    this.categories,
    this.message,
  });

  const CategoryState.loading() : this._(resultState: ResultState.loading);

  const CategoryState.hasData(
    List<CategoryModel>? categories,
  ) : this._(
          resultState: ResultState.hasData,
          categories: categories,
        );

  const CategoryState.noData(String message)
      : this._(resultState: ResultState.noData, message: message);

  const CategoryState.error(String message)
      : this._(resultState: ResultState.error, message: message);
}
