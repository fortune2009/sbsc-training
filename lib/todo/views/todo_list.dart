import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:test_app/reusable/colors.dart';
import 'package:test_app/reusable/size.dart';
import 'package:test_app/reusable/text_styles.dart';
import 'package:test_app/todo/db/database.dart';
import 'package:test_app/todo/model/listView_model.dart';

class TodoList extends StatefulWidget {
  final category;
  final categoryColor;

  TodoList({Key key, this.category, this.categoryColor}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _dateController = TextEditingController();

  String deadlineDateInString = 'Pick a deadline';
  String deadlineTimeInString = 'Pick Time';
  DateTime deadlineDate;
  TimeOfDay deadlineTime;
  bool isDateSelected;
  bool isTimeSelected;
  bool _isDone = false;

  List forListView = [];

  List newAddToList = [];

  Todo todo = new Todo();

  @override
  initState() {
    super.initState();
    getTodo();
  }

  Future getTodo() async {
    forListView = await TodoProvider.instance.getAllTodo();
    print('All db lis $forListView');
  }

  setNewAddToList(Todo value) async {
    print('from todo ${value.description} and $forListView');
    setState(() {
      if (value != null && !newAddToList.contains(value)) {
        newAddToList.add(value);
      }
    });
    await insert(value);
  }

  Future insert(Todo todo) async {
    await TodoProvider.instance.insert(todo);
  }

  List get getNewAddToList => newAddToList;

  // List get getForListView => forListView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhite.withOpacity(0.40),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: kBlack,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        // ti
        title: Text(
          '${widget.category} List',
          style: h3Style.copyWith(color: kBlack),
        ),
        shadowColor: Colors.transparent,
        // titleSpacing: 60,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: SvgPicture.asset(
              'assets/svgs/settingAction.svg',
              color: kBlack,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(0, 20),
          child: SizedBox(),
        ),
      ),
      body: _todoListView(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: widget.categoryColor,
        onPressed: () => _dialogShow(clear: true),
        child: Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }

  _todoListView() {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Slidable(
          secondaryActions: [
            IconSlideAction(
              color: kBlack,
              icon: Icons.edit_outlined,
              onTap: () {},
            ),
            IconSlideAction(
              color: kPink,
              icon: Icons.remove_circle_outline_sharp,
              onTap: () {},
            ),
          ],
          actionExtentRatio: 0.15,
          actionPane: SlidableDrawerActionPane(),
          child: Container(
              child: ListTileTheme(
            child: ListTile(
              tileColor: newAddToList[index].isDone
                  ? kPurpleAccent.withOpacity(0.10)
                  : Colors.white54,
              leading: newAddToList[index].isDone
                  ? IconButton(
                      icon: Icon(
                        Icons.done_rounded,
                        color: kGreen,
                      ),
                      onPressed: () {
                        setState(() {
                          newAddToList[index].isDone = false;
                        });
                      },
                    )
                  : IconButton(
                      icon: Icon(
                        Icons.star_border_outlined,
                        color: widget.categoryColor,
                      ),
                      onPressed: () {
                        setState(() {
                          newAddToList[index].isDone = true;
                        });
                      },
                    ),
              title: Text(
                '${newAddToList[index].title}',
                style: TextStyle(
                    decoration: newAddToList[index].isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
              subtitle: Text(
                '${newAddToList[index].description}',
                style: h3Style.copyWith(
                    color: kBlack,
                    decoration: newAddToList[index].isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
              trailing: Text('${newAddToList[index].date}',
                  style: TextStyle(
                      decoration: newAddToList[index].isDone
                          ? TextDecoration.lineThrough
                          : TextDecoration.none)),
            ),
          )),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: kGrey,
        );
      },
      itemCount: newAddToList.length,
    );
  }

  clearController() {
    _titleController.clear();
    _descriptionController.clear();
    _timeController.clear();
    _dateController.clear();
  }

  _dialogShow({bool clear}) {
    clear == true ? clearController() : DoNothingAction();
    showDialog(
        context: context,
        builder: (index) => Dialog(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 300,
                  child: Column(
                    children: [
                      TextField(
                        controller: _titleController,
                        decoration: InputDecoration(
                          labelText: 'Title',
                        ),
                      ),
                      vSize15,
                      TextField(
                        controller: _descriptionController,
                        decoration: InputDecoration(
                          labelText: 'Add a description',
                        ),
                      ),
                      vSize15,
                      Row(
                        children: [
                          SizedBox(
                              width: 150,
                              child: TextField(
                                  controller: _dateController,
                                  decoration: InputDecoration(
                                    labelText: 'Pick a deadline',
                                  ),
                                  readOnly: true,
                                  onTap: () async {
                                    final datePick = await showDatePicker(
                                        context: context,
                                        initialDate: new DateTime.now(),
                                        firstDate: new DateTime(1900),
                                        lastDate: new DateTime(2100));
                                    if (datePick != null &&
                                        datePick != deadlineDate) {
                                      setState(() {
                                        deadlineDate = datePick;
                                        isDateSelected = true;

                                        // put it here
                                        deadlineDateInString =
                                            "${deadlineDate.month}/${deadlineDate.day}/${deadlineDate.year}"; // 08/14/2019
                                        _dateController.text =
                                            deadlineDateInString;
                                      });
                                    }
                                  })),
                          hSize10,
                          SizedBox(
                            width: 80,
                            child: TextField(
                                controller: _timeController,
                                decoration: InputDecoration(
                                  labelText: 'Pick Time',
                                ),
                                readOnly: true,
                                onTap: () async {
                                  final timePick = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );

                                  if (timePick != null &&
                                      timePick != deadlineTime) {
                                    setState(() {
                                      deadlineTime = timePick;
                                      isDateSelected = true;
                                      // put it here
                                      deadlineTimeInString =
                                          "${deadlineTime.hour}:${deadlineTime.minute}"; //
                                      _timeController.text =
                                          deadlineTimeInString;
                                    });
                                  }
                                }),
                          ),
                        ],
                      ),
                      vSize15,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                onPressed: () {},
                                child: Text('Cancel'),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(kPink),
                                )),
                          ),
                          hSize15,
                          Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  List<dynamic> list = [];
                                  list.add(_titleController.text);
                                  list.add(_descriptionController.text);
                                  list.add(_dateController.text);
                                  list.add(_timeController.text);
                                  list.add(_isDone);

                                  if (list.isNotEmpty) {
                                    todo = Todo(
                                        title: list[0],
                                        description: list[1],
                                        date: list[2],
                                        time: list[3],
                                        isDone: list[4]);
                                    print('jskjfsg ${todo.title}');
                                  }

                                  setState(() {
                                    setNewAddToList(todo);
                                    print('list $list');
                                    // print('list $list');
                                  });
                                  Navigator.pop(context);
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      kBluelightAccent),
                                ),
                                child: Text('Add')),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ));
  }

  @override
  dispose() {
    super.dispose();
    TodoProvider.instance.close();
  }
}
