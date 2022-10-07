import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:sqflite/sqlite_api.dart';

class DBProvider {
  static Database? _database;

  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database?> get database async {
    if (_database != null) {
      _database = await initDB();
    }
  }

  Future<Database?> initDB() async {
// PATH DE LA BASE EN LA APLICACION

    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'DBApp.db');

    print('TENEMOS EL PATH: $path');

//CREAMOS LA BASE DE DATOS

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db){},
      onCreate: (Database db, int version) async{
 await db.execute('''






''');

      }
    );
  }
}
