import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {

  static const String dbName = '';
  static const String tableName = '';

  DB._(){
    openDB();
  }

  static DB? _db;
  static Database? _database;

  static DB getInstance() {
    _db ??= DB._();
    return _db!;
  }


  Future<void> openDB() async {
    _database ??= await openDatabase(
        join(await getDatabasesPath(), '$dbName.db'),
        version: 1,
        onCreate: (db, version) {
          db.execute('''
            CREATE TABLE $tableName(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              title TEXT NOT NULL,
              content TEXT NOT NULL
            )''');
        }
    );
  }

  Future<int> insert(Map<String, Object> values) async {
    await openDB();
    return _database!.insert(tableName, values, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> delete(int id) async {
    await openDB();
    return _database!.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> selectAll() async {
    await openDB();
    return _database!.query(tableName);
  }

}