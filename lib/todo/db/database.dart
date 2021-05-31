import 'dart:async';
import 'dart:core';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:test_app/todo/model/db_model_constant.dart';
import 'package:test_app/todo/model/listView_model.dart';

class TodoProvider {
  Database _db;

  Future<Database> get database async {
    if (_db != null) return _db;

    _db = await open();
  }

  TodoProvider._privateConstructor();

  static final TodoProvider instance = TodoProvider._privateConstructor();

  Future<Database> open() async {
    WidgetsFlutterBinding.ensureInitialized();
    // Get a location using getDatabasesPath
    Directory databasesPath = await getApplicationDocumentsDirectory();
    String path = join(databasesPath.path, dbName);

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, version) async {
    await db.execute('''
        CREATE TABLE $tableTodo (
          $columnId INTEGER PRIMARY KEY,
          $columnTitle TEXT NOT NULL,
          $columnDescription TEXT NOT NULL,
          $columnDate TEXT NOT NULL,
          $columnTime TEXT NOT NULL,
          $columnDone TEXT NOT NULL
        )
      ''');
  }

  Future<int> insert(Todo todo) async {
    Database db = await instance.database;
    return await db.insert(tableTodo, todo.toMap());
  }

  Future<List<Todo>> getAllTodo() async {
    Database db = await instance.database;
    print('seeing db in getalltodo $db');
    var res = await db.query(tableTodo);

    List<Todo> maps =
        res.isNotEmpty ? res.map((e) => Todo.fromMap(e)).toList() : [];
    return maps;
    // List.generate(
    //     maps.length,
    //     (index) => Todo(
    //           id: maps[index]['id'],
    //           title: maps[index]['title'],
    //           description: maps[index]['description'],
    //           date: maps[index]['date'],
    //           time: maps[index]['time'],
    //           isDone: maps[index]['isDone'] == 1,
    //         ));
  }

  Future<Todo> getTodo(int id) async {
    Database db = await instance.database;
    List<Map> maps = await db.query(tableTodo,
        columns: [
          columnId,
          columnTitle,
          columnDescription,
          columnDate,
          columnTime,
          columnDone
        ],
        where: '$columnId = ?',
        whereArgs: [id]);

    if (maps.length > 0) {
      return Todo.fromMap(maps.first);
    }
    return null;
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(tableTodo, where: '$columnId = ?', whereArgs: [id]);
  }

  Future close() async => _db.close();
}
