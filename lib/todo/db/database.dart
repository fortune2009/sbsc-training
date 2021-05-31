import 'dart:async';
import 'dart:core';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:test_app/todo/model/db_model_constant.dart';
import 'package:test_app/todo/model/listView_model.dart';

class TodoProvider {
  TodoProvider._privateConstructor();

  static TodoProvider instance = TodoProvider._privateConstructor();
  Database db;

  Future<Database> get database async {
    db = await open();
    return db;
  }

  Future open() async {
    WidgetsFlutterBinding.ensureInitialized();
    // Get a location using getDatabasesPath
    final databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dbName);

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) {
      db.execute('''
        create table $tableTodo (
          $columnId integer primary key,
          $columnTitle text not null,
          $columnDescription text not null,
          $columnDate text not null,
          $columnTime text not null,
          $columnDone text not null
        )
      ''');
    });
  }

  Future<int> insert(Todo todo) async {
    Database db = await instance.database;
    return await db.insert(tableTodo, todo.toMap());
  }

  Future<List<Todo>> getAllTodo() async {
    Database db = await instance.database;
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
    return await db.delete(tableTodo, where: '$columnId = ?', whereArgs: [id]);
  }

  Future close() async => db.close();
}
