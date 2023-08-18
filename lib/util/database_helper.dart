import 'package:pasword_vault/model/account_model.dart';
import 'package:pasword_vault/model/category_model.dart';
import 'package:pasword_vault/model/password_model.dart';
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
      CREATE TABLE $_databaseAccountName (
        id INTEGER PRIMARY KEY,
        name TEXT
        password TEXT
      );
    ''');
    await db.execute('''
      CREATE TABLE $_databaseCategoryName (
        id INTEGER PRIMARY KEY,
        title TEXT
        userId INTEGER
      );
    ''');
    await db.execute('''
      CREATE TABLE  $_databasePasswordName (
        id INTEGER PRIMARY KEY,
        title TEXT,
        username TEXT,
        password TEXT,
        byte BLOB,
        category TEXT,
        date TEXT
      );
    ''');
  }

  final String _databaseCategoryName = 'Category';
  final String _databasePasswordName = 'Password';
  final String _databaseAccountName = 'Account';

  Future<void> insertAccount(AccountModel accountModel) async {
    final db = await database;
    await db!.insert(
      _databaseAccountName,
      accountModel.toMap(),
    );
  }

  Future<String> getAccount(String name) async {
    final db = await database;
    List<Map<String, dynamic>> results = await db!.query(
      _databaseAccountName,
      where: "name = ?",
      whereArgs: [name],
    );

    if (results.isNotEmpty) {
      return results
          .map((res) => AccountModel.fromMap(res))
          .toList()[0]
          .password;
    } else {
      return '';
    }
  }

  Future<void> insertCategory(CategoryModel categoryModel) async {
    final db = await database;
    await db!.insert(
      _databaseCategoryName,
      categoryModel.toMap(),
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

  Future<List<PasswordModel>> getPassword(String category) async {
    final db = await database;
    List<Map<String, dynamic>> results = await db!.query(
      _databasePasswordName,
      where: "category = ?",
      whereArgs: [category],
    );
    return results.map((res) => PasswordModel.fromMap(res)).toList();
  }
}
