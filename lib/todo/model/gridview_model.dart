import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_app/reusable/colors.dart';
import 'package:test_app/reusable/size.dart';
import 'package:test_app/reusable/text_styles.dart';
import 'package:test_app/todo/views/todo_list.dart';

List<Widget> getGridList({BuildContext context, var value}) {
  List<Widget> gridList = [
    GridViewModel(
      color: kPurpleAccent,
      icon: Icons.work,
      title: 'Work',
      task: 4,
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TodoList(
                    category: 'Work',
                    categoryColor: kPurpleAccent,
                  ))),
    ),
    GridViewModel(
      color: kBluelightAccent,
      icon: Icons.person,
      title: 'Personal',
      task: 4,
    ),
    GridViewModel(
      color: kPinkAccent,
      icon: Icons.headset,
      title: 'Life',
      task: 4,
    ),
    GridViewModel(
      color: kYellow,
      icon: Icons.location_on,
      title: 'Visit',
      task: 4,
    ),
  ];
  if (value != null) {
    gridList.add(value);
  }

  return gridList;
}

addToGridList(
    {BuildContext context,
    String icon,
    String title,
    String color,
    String task}) {
  var value = GridViewModel(
    color: color,
    icon: icon,
    task: task,
    title: title,
    onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TodoList(
                  category: title,
                  categoryColor: color,
                ))),
  );
  getGridList(context: context, value: value);
}

class GridViewModel extends StatelessWidget {
  final icon;
  final title;
  final color;
  final task;
  final onTap;

  GridViewModel({this.icon, this.title, this.color, this.task, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: kWhite),
        child: Column(
          children: [
            vSize30,
            Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: color.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(100)),
                child: Icon(
                  icon ?? Icons.ac_unit,
                  color: color,
                )),
            vSize30,
            Text(
              title,
              style: bodyText1.copyWith(fontWeight: FontWeight.bold),
            ),
            vSize8,
            Text(
              '$task task(s)',
              style: bodyText3.copyWith(color: kGrey),
            ),
          ],
        ),
      ),
    );
  }
}
