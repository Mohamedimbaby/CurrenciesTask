import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

@module
abstract class SqfliteModule {
  @preResolve
  Future<Database> get database => _initDB("currencies.db");

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }
  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const imageType = 'BLOB NOT NULL';
    const numberType = 'REAL';

    await db.execute('''
      CREATE TABLE currencies (
        id $idType,
        code $textType,
        currency $textType,
        country $textType,
        flag $imageType,
        price $numberType
      )
    ''');
  }

}
