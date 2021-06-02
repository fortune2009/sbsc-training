import 'dart:async';
import 'dart:core';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:todo_app/todo/model/db_model_constant.dart';
import 'package:todo_app/todo/model/listView_model.dart';

class TodoProvider {
  Database db;

  Future<Todo> openDb({Todo todo}) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dbName);
    await open(path);
    return todo;
  }

  Future open(String path) async {
    // Database forOpen;
    if (db == null || !db.isOpen) {
      db = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        await db.execute('''CREATE TABLE $tableTodo (
          $columnId INTEGER PRIMARY KEY,
          $columnTitle TEXT NOT NULL,
          $columnDescription TEXT NOT NULL,
          $columnDate TEXT NOT NULL,
          $columnTime TEXT NOT NULL,
          $columnDone TEXT 
        )''');
      });
      print('see if dp opens $db');
    }
    return db;
  }

  // Future _onCreate(Database db, int version) async {
  //   await db.execute('''CREATE TABLE $tableTodo (
  //         $columnId INTEGER PRIMARY KEY,
  //         $columnTitle TEXT NOT NULL,
  //         $columnDescription TEXT NOT NULL,
  //         $columnDate TEXT NOT NULL,
  //         $columnTime TEXT NOT NULL,
  //         $columnDone TEXT NOT NULL
  //       )''', );
  // }

  Future<int> insert(Todo todo) async {
    todo..id = await db.insert(tableTodo, todo.toMap());
    return todo.id;
  }

  Future<List<Todo>> getAllTodo() async {
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

  Future<int> update(int id, Todo todo) async {
    return await db.update(tableTodo, todo.toMap(), where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    return await db.delete(tableTodo, where: '$columnId = ?', whereArgs: [id]);
  }

  Future close() async => db.close();
}
