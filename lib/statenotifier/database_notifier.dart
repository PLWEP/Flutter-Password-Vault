import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pasword_vault/model/category.dart';
import 'package:pasword_vault/util/database_helper.dart';
import 'package:pasword_vault/util/result_state.dart';

class DatabaseProvider extends StateNotifier<DatabaseState> {
  final DatabaseHelper databaseHelper;

  DatabaseProvider({required this.databaseHelper})
      : super(DatabaseState.loading()) {
    _getCategory();
  }

  void _getCategory() async {
    state = DatabaseState.loading();
    final category = await databaseHelper.getCategory();
    if (category.isNotEmpty) {
      state = DatabaseState.hasData(category);
    } else {
      state = DatabaseState.noData('No Category Found');
    }
  }

  Future<void> addCategory(CategoryModel category) async {
    try {
      await databaseHelper.insertCategory(category);
      _getCategory();
    } catch (e) {
      state = DatabaseState.error('Error Found: $e');
    }
  }
}

class DatabaseState {
  final ResultState resultState;
  final List<CategoryModel>? categories;
  final String? message;

  const DatabaseState._(
      {required this.resultState, this.categories, this.message});

  const DatabaseState.loading() : this._(resultState: ResultState.loading);

  const DatabaseState.hasData(List<CategoryModel> categories)
      : this._(resultState: ResultState.hasData, categories: categories);

  const DatabaseState.noData(String message)
      : this._(resultState: ResultState.noData, message: message);

  const DatabaseState.error(String message)
      : this._(resultState: ResultState.error, message: message);
}
