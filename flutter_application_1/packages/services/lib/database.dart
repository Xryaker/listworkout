import 'dart:io';
import 'package:flutter_application_1_services/models/db_models.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static final DBProvider db = DBProvider();
  Database? _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationSupportDirectory();
    String path = join(documentsDirectory.path, "TetsDB.db");
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute("CREATE TABLE `TODO` ("
            "`id` INT NOT NULL AUTO_INCREMENT,"
            "	`idtodo` INT NOT NULL,"
            "	`first` INT,"
            "	`second` INT,"
            "	`thd` INT,"
            "	`fth` INT,"
            "	`fiveth` INT,"
            "	`k1` INT,"
            "	`k2` INT,"
            "	`k3` INT,"
            "	`k4` INT,"
            "	`k5` INT,"
            " `data` DATE DEFAULT CURRENT_TIMESTAMP NOT NULL);");
      },
    );
  }

  addTodo(DBtodo todo) async {
    final db = await database;
    var row = await db.rawInsert(
        "INSERT Into TODO (id,idtodo,first,second,thd,fth,fiveth,k1,k2,k3,k4,k5)"
        "VALUES (?,?,?,?,?,?,?,?,?,?,?,?)",
        [
          todo.id,
          todo.idtodo,
          todo.first,
          todo.second,
          todo.thd,
          todo.fth,
          todo.fiveth,
          todo.k1,
          todo.k2,
          todo.k3,
          todo.k4,
          todo.k5
        ]);
    return row;
  }
}
