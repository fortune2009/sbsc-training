
import 'db_model_constant.dart';

class Todo {
  int id;
  String title;
  String description;
  String date;
  String time;
  bool isDone;

  Todo(
      {this.id,
      this.title,
      this.description,
      this.date,
      this.time,
      this.isDone});

  Map<String, Object> toMap() {
    var map = <String, Object>{
      columnId: id,
      columnTitle: title,
      columnDescription: description,
      columnDate: date,
      columnTime: time,
      columnDone: isDone == true ? '1' : '0'
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  Todo.fromMap(Map<String, Object> map) {
    id = map[columnId];
    title = map[columnTitle];
    description = map[columnDescription];
    date = map[columnDate];
    time = map[columnTime];
    isDone = map[columnDone] == '1';
  }
}
