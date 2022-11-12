import 'package:ieanjesus/src/models/letra_musica_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {

  static Future<Database> _openDB() async {

    return openDatabase(join(await getDatabasesPath(),'letrasMusicas.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE letrasMusicas (id INTEGER PRIMARY KEY, tipo TEXT, titulo TEXT,letra TEXT)",
        );
      }, version: 1);
  }

  static Future insert(LetraMusica _letraMusica) async {
    Database database = await _openDB();

    return database.insert("letrasMusicas", _letraMusica.toMap());
  }

  static Future delete(LetraMusica _letra) async {
    Database database = await _openDB();

    return database.delete("letrasMusicas", where: "id = ?", whereArgs: [_letra.id]);
  }

  static Future update(LetraMusica _letra) async {
    Database database = await _openDB();

    return database.update("letrasMusicas", _letra.toMap(), where: "id = ?", whereArgs: [_letra.id]);
  }

  static Future<List<LetraMusica>> letrasMusicas( String? search) async {
    Database database = await _openDB();
    // final List<Map<String, dynamic>> letraMusicasMap = await database.query("letrasMusicas");
    final List<Map<String, dynamic>> letraMusicasMap = await database.rawQuery('''

SELECT * FROM letrasMusicas WHERE titulo LIKE '%$search'



''');

// print('esta es la letra: $letraMusicasMap');


    return List.generate(letraMusicasMap.length,
            (i) => LetraMusica(
              id: letraMusicasMap[i]['id'],
              tipo: letraMusicasMap[i]['tipo'],
              titulo: letraMusicasMap[i]['titulo'],
              letra: letraMusicasMap[i]['letra']
            ));
  }
  static Future<List<LetraMusica>> buscarMusicas() async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> letraMusicasMap = await database.query("letrasMusicas");

// print('esta es la letra: $letraMusicasMap');


    return List.generate(letraMusicasMap.length,
            (i) => LetraMusica(
              id: letraMusicasMap[i]['id'],
              tipo: letraMusicasMap[i]['tipo'],
              titulo: letraMusicasMap[i]['titulo'],
              letra: letraMusicasMap[i]['letra']
            ));
  }

  // CON SENTENCIAS
  static Future<void> insertar2(LetraMusica letraMusica) async {
    Database database = await _openDB();
    var resultado = await database.rawInsert("INSERT INTO letraMusica (id, tipo,titulo, letra)"
    " VALUES (${letraMusica.id}, ${letraMusica.tipo}, ${letraMusica.titulo},${letraMusica.titulo})");

  }
}