import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DatabaseHelper{
  static const String _dbName = 'advice.db';
  static const int _dbVersion = 5;

  static const String table = 'advices';
  static const String columnId = 'id';
  static const String columnAdvice = 'advice';

  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();
  late Database _db;
  
  Future<Database> get database async{
    _db = await _initDatabase();
    return _db;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, _dbName);
    final database = await openDatabase(path,
        version: _dbVersion,
        onCreate: (Database db, int version) async{
          await db.execute('CREATE TABLE $table ( '
              '$columnId INTEGER PRIMARY KEY AUTOINCREMENT, '
              '$columnAdvice TEXT NOT NULL )'
          );
        });
    return database;
  }

  void insertAdvice(String advice) async {
    final db = await _instance.database;
    await db.insert(
      'advices',
      {'advice': advice},
      conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  Future<List<String>> getAllAdvices() async{
    final db = await _instance.database;
    final List<Map<String,dynamic>> maps = await db.query('advice');
    return List.generate(maps.length, (i){
      return maps[i]['advice'] as String;
    });
  }

  Future<void> close() async{
    final db = await database;
    db.close();
  }

}