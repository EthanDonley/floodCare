import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseService {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    // Ensure the database is initialized here before returning
    _database = await initDB();
    return _database!;
  }

  initDB() async {
  String path = join(await getDatabasesPath(), 'data.db');
  return await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
    await db.execute("CREATE TABLE Data(id INTEGER PRIMARY KEY, declarationTitle TEXT)");
  });
}

  // Example function to fetch data
  Future<List<Map<String, dynamic>>> fetchData() async {
    final db = await database; // This ensures the database is initialized
    return await db.query('Data');
  }
}