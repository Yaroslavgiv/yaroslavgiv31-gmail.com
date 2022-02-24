import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:tudu/model/excel.dart';

class DBProvider {
  DBProvider._(); // синглТон обеспечение глобального доступа
  static final DBProvider db = DBProvider._();

  Database? _database;

  String excelsTable = 'Excels';
  String columnId = 'id';
  String columnName = 'name';

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDB();
    return _database;
  }

  Future<Database> _initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'Excel.db';
    return await openDatabase(path, version: 1, onCreate: _creeteDB);
  }

  void _creeteDB(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $excelsTable($columnId INTEGER PRIMARY KEY AUTOINCREMENT, $columnName TEXT)',
    );
  }
  //read чтение
  Future<List<Excel>> getExcels() async{
    Database? db = await database;
    final List<Map<String, dynamic>> excelsMapList = await db!.query(excelsTable);
    final List<Excel> excelsList = [];
    excelsMapList.forEach((excelMap) {
      excelsList.add(Excel.fromMap(excelMap));
    });
    return excelsList;
  }

  // insert добавление
  Future<Excel> insertExcel(Excel excel) async{
    Database? db = await database;
    excel.id =await db!.insert(excelsTable, excel.toMap());
    return excel;
  }

  // uodate обновление
  Future<int> updateExcel(Excel excel) async {
    Database? db = await database;
    return await db!.update(
        excelsTable,
        excel.toMap(),
        where: '$columnId = ?',
        whereArgs: [excel.id],
    );
  }

  // delete
  Future<int> deleteExcel(int id) async {
    Database? db = await database;
    return await db!.delete(
      excelsTable,
      where: '$columnId = ?',
      whereArgs: [id]
    );
  }
  Future deleteAllExcel() async {
    Database? db = await database;
    db!.rawDelete("Delete from $excelsTable");
  }
}
