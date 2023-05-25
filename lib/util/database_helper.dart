import 'package:pasword_vault/model/category.dart';
import 'package:pasword_vault/model/password.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _instance;
  static Database? _database;

  DatabaseHelper._internal() {
    _instance = this;
  }

  factory DatabaseHelper() => _instance ?? DatabaseHelper._internal();

  Future<Database?> get database async {
    _database ??= await _initDb();
    return _database;
  }

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/password_vault.db';

    var db = await openDatabase(databasePath, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_databaseCategoryName (
        id INTEGER PRIMARY KEY,
        title TEXT
      );
    ''');
    await db.execute('''
      CREATE TABLE  $_databasePasswordName (
        id INTEGER PRIMARY KEY,
        title TEXT,
        username TEXT,
        password TEXT,
        category TEXT,
        date TEXT
      );
    ''');
  }

  final String _databaseCategoryName = 'Category';
  final String _databasePasswordName = 'Password';

  Future<void> insertCategory(String categoryTitle) async {
    final db = await database;
    await db!.insert(
      _databaseCategoryName,
      CategoryModel(title: categoryTitle).toMap(),
    );
  }

  Future<List<CategoryModel>> getCategory() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db!.query(_databaseCategoryName);
    return results.map((res) => CategoryModel.fromMap(res)).toList();
  }

  Future<void> insertPassword(PasswordModel passModel) async {
    final db = await database;
    await db!.insert(
      _databasePasswordName,
      passModel.toMap(),
    );
  }

  Future<List<PasswordModel>> getPasword(String category) async {
    final db = await database;
    List<Map<String, dynamic>> results = await db!.query(_databasePasswordName,
        where: "category = ?", whereArgs: [category]);
    return results.map((res) => PasswordModel.fromMap(res)).toList();
  }
}
