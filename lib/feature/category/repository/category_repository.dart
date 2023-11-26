import 'package:fpdart/fpdart.dart';
import 'package:pasword_vault/common/failure.dart';
import 'package:pasword_vault/common/typedef.dart';
import 'package:pasword_vault/model/category_model.dart';
import 'package:pasword_vault/common/database_helper.dart';

class CategoryRepository {
  final DatabaseHelper _databaseHelper;

  CategoryRepository({required DatabaseHelper databaseHelper})
      : _databaseHelper = databaseHelper;

  Future<List<CategoryModel>> getCategory() async {
    final category = await _databaseHelper.getCategory();

    return category.isEmpty ? [] : category;
  }

  FutureVoid addCategory(CategoryModel categoryModel) async {
    try {
      return right(await _databaseHelper.insertCategory(categoryModel));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
