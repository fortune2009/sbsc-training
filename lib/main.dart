import 'package:flutter/material.dart';
import 'package:todo_app/todo/views/todo_list.dart';
import 'todo/views/main_entry.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AllTodoList(),
    );
  }
}