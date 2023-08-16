import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  late Database _database;

  Future<void> open() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'my_database.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE IF NOT EXISTS json_data (
            id INTEGER PRIMARY KEY,
            jsonData TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertJson(String jsonData) async {
    return await _database.insert('json_data', {'jsonData': jsonData});
  }

  Future<List<Map<String, dynamic>>> retrieveJsonData() async {
    return await _database.query('json_data');
  }
}
