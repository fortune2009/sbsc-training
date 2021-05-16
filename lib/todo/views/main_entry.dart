import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:test_app/reusable/colors.dart';
import 'package:test_app/reusable/size.dart';
import 'package:test_app/reusable/text_styles.dart';
import 'package:test_app/todo/model/gridview_model.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  TextEditingController titleController = TextEditingController();
  TextEditingController iconController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController taskController = TextEditingController();

  var _images = [
    'assets/image/img1.jpg',
    'assets/image/img2.jpg',
    'assets/image/img3.jpg',
    'assets/image/img4.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: FloatingActionButton(
          backgroundColor: kYellowAccent.withOpacity(0.70),
          child: Icon(
            Icons.add,
            color: kBlack,
            size: 40,
          ),
          onPressed: () {
            showDialog(
                context: context,
                builder: (index) => Dialog(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: 350,
                          child: Column(
                            children: [
                              TextField(
                                controller: titleController,
                                decoration: InputDecoration(
                                  hintText: 'e.g Work',
                                  labelText: 'Category',
                                ),
                              ),
                              vSize15,
                              TextField(
                                controller: iconController,
                                decoration: InputDecoration(
                                  hintText: 'e.g Icons.done',
                                  labelText: 'Icon',
                                ),
                              ),
                              vSize15,
                              TextField(
                                controller: taskController,
                                decoration: InputDecoration(
                                  hintText: 'e.g 3',
                                  labelText: 'Task',
                                ),
                              ),
                              vSize15,
                              TextField(
                                controller: colorController,
                                decoration: InputDecoration(
                                  hintText: 'e.g Colors.green',
                                  labelText: 'Color',
                                ),
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
                                          setState(() {
                                            addToGridList(
                                              title: titleController.text,
                                              color: colorController.text,
                                              context: context,
                                              task: taskController.text,
                                              icon: iconController.text,
                                            );
                                          });
                                          titleController.clear();
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
        ),
        // appBar: AppBar(
        //   title: Text(
        //     'Welcome back, Jason',
        //     style: h3Style.copyWith(color: kBlack),
        //   ),
        //   leading: SvgPicture.asset(
        //     'assets/svgs/hamburger.svg',
        //     color: kBlack,
        //   ),
        //   leadingWidth: 25,
        //   backgroundColor: Colors.transparent,
        //   shadowColor: Colors.transparent,
        //   actions: [
        //     SvgPicture.asset(
        //       'assets/svgs/settingAction.svg',
        //       color: kBlack,
        //     ),
        //   ],
        //   bottom: PreferredSize(
        //     preferredSize: Size(0, 50),
        //     child: SizedBox(),
        //   ),
        // ),
        backgroundColor: Colors.white.withOpacity(0.97),
        body: _customScrollView()
        // SingleChildScrollView(
        //   padding: EdgeInsets.symmetric(horizontal: 20),
        //   child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //     vSize24,
        //     Text(
        //       '{} of items not completed.',
        //       style: h4Style.copyWith(color: kGrey),
        //     ),
        //     vSize24,
        //     GridView.count(
        //         shrinkWrap: true,
        //         crossAxisCount: 2,
        //         crossAxisSpacing: 10,
        //         mainAxisSpacing: 10,
        //         children: gridList)
        //   ]),
        // ),
        );
  }

  Widget _customScrollView() {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 250.0,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text('Welcome back, Jason',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  )),
              background: Swiper(
                itemCount: _images.length,
                itemBuilder: (BuildContext context, int index) => Image.asset(
                  _images[index],
                  fit: BoxFit.cover,
                ),
                autoplay: true,
              )),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GridView.count(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: getGridList(context: context))),
              childCount: 1),
        )
      ],
    );
  }
}
