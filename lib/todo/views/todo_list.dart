import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/reusable/colors.dart';
import 'package:test_app/reusable/size.dart';
import 'package:test_app/reusable/text_styles.dart';

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

  setNewAddToList(value) {
    setState(() {
      newAddToList.addAll(value);
    });
  }

  List get getNewAddToList => newAddToList;

  setForListView(value) {
    setState(() {
      forListView.add(value);
    });
  }

  List get getForListView => forListView;

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
        title: Container(
          height: 50,
          margin: EdgeInsets.only(top: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Text(
                  '${widget.category} List',
                  style: h3Style.copyWith(color: kBlack),
                ),
              ),
              vSize4,
              Expanded(
                child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                  style: bodyText1.copyWith(color: kBlack),
                  value: 'day',
                  items: ['day', 'day2']
                      .map((e) => DropdownMenuItem<String>(
                            child: new Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (value) {
                    print('$value');
                  },
                )),
              )
            ],
          ),
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
        onPressed: () {
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
                                  width: 100,
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
                                        List list = [
                                          _titleController.text,
                                          _descriptionController.text,
                                          _dateController.text,
                                          _timeController.text
                                        ];
                                        setState(() {
                                          setNewAddToList(list);
                                          print('list $list');
                                        });

                                        Navigator.pop(context);
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
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
        },
        child: Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }

  _todoListView() {
    return ListView.separated(
      itemBuilder: (context, index) => Slidable(
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
            leading: _isDone
                ? Icon(
                    Icons.done_rounded,
                    color: kGreen,
                  )
                : IconButton(
                    icon: Icon(
                      Icons.star_border_outlined,
                      color: widget.categoryColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _isDone = true;
                      });
                    },
                  ),
            title: Text(getForListView[index][0]),
            subtitle: Text(
              getForListView[index][0],
              style: h3Style.copyWith(color: kBlack),
            ),
          ),
        )),
      ),
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: kGrey,
        );
      },
      itemCount: getForListView.length,
    );
  }

  _buildTodo() {
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
          leading: _isDone
              ? Icon(
                  Icons.done_rounded,
                  color: kGreen,
                )
              : IconButton(
                  icon: Icon(
                    Icons.star_border_outlined,
                    color: widget.categoryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _isDone = true;
                    });
                  },
                ),
          title: Text('title'),
          subtitle: Text(
            'Subtitle',
            style: h3Style.copyWith(color: kBlack),
          ),
        ),
      )),
    );
  }
}
