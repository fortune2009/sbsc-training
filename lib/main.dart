import 'package:flutter/material.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'body.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(home: BmiCalculator(title: 'BMI CALCULATOR'));
    return MaterialApp(home: BmiCalculator());
  }
}

// class BmiCalculator extends StatefulWidget {
//   BmiCalculator({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _BmiCalculatorState createState() => _BmiCalculatorState();
// }

// class _BmiCalculatorState extends State<BmiCalculator> {
//   int currentindex = 0;
//   double _value = 0;
//   int _counter = 0;
//   int _age = 0;
//   var weightInput = TextEditingController();
//   var ageInput = TextEditingController();

//   void _incrementCounter(value) {
//     _counter += int.parse(value);
//     setState(() {
//       _counter++;
//     });
//   }

//   void _decrementCounter(value) {
//     _counter += int.parse(value);
//     setState(() {
//       _counter--;
//     });
//   }

//   // void _incrementAge() {
//   //   setState(() {
//   //     _age++;
//   //   });
//   // }

//   // void _decrementAge() {
//   //   setState(() {
//   //     _age--;
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//           backgroundColor: Color(0xff090b1e),
//           appBar: AppBar(
//             backgroundColor: Color(0xff0A0D22),
//             leading: Icon(Icons.sort),
//             title: Text(
//               widget.title,
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 18),
//             ),
//           ),
//           body: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 15),
//             child: Container(
//               child: Column(children: [
//                 Spacer(),
//                 Container(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                           height: 150,
//                           width: 170,
//                           decoration: BoxDecoration(
//                             color: Color(0xff1D1F33),
//                             shape: BoxShape.rectangle,
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               SizedBox(height: 10),
//                               IconTheme(
//                                 data: IconThemeData(
//                                     color: Colors.white, size: 80),
//                                 child: Icon(MdiIcons.genderMale),
//                               ),
//                               SizedBox(height: 5),
//                               Text("MALE",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 20,
//                                     color: Colors.white,
//                                   ))
//                             ],
//                           )),
//                       SizedBox(width: 7.0),
//                       Container(
//                           height: 150,
//                           width: 170,
//                           decoration: BoxDecoration(
//                             color: Color(0xff1D1F33),
//                             shape: BoxShape.rectangle,
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                           child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 SizedBox(
//                                   height: 5,
//                                 ),
//                                 RotationTransition(
//                                   turns: new AlwaysStoppedAnimation(40 / 360),
//                                   child: IconTheme(
//                                     data: IconThemeData(
//                                         color: Colors.white, size: 80),
//                                     child: Icon(MdiIcons.genderFemale),
//                                   ),
//                                 ),
//                                 SizedBox(height: 7),
//                                 Text("FEMALE",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 20,
//                                       color: Colors.white,
//                                     ))
//                               ]))
//                     ],
//                   ),
//                 ),
//                 Spacer(),
//                 // SizedBox(height: 15),
//                 Container(
//                   //margin: EdgeInsets.symmetric(horizontal: 40),
//                   height: 160,
//                   width: 350,
//                   decoration: BoxDecoration(
//                     color: Color(0xff1D1F33),
//                     shape: BoxShape.rectangle,
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       SizedBox(height: 20),
//                       Text("HEIGHT",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20,
//                               color: Color(0xff868892))),
//                       RichText(
//                           text: TextSpan(
//                         text: '${(_value).round()} ',
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 50,
//                             color: Color(0xffffffff)),
//                         children: [
//                           TextSpan(
//                               text: 'cm',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20,
//                                   color: Color(0xff868892))),
//                         ],
//                       )),
//                       Slider(
//                           min: 0,
//                           max: 200,
//                           onChanged: (double newValue) {
//                             setState(() {
//                               _value = newValue;
//                             });
//                           },
//                           inactiveColor: Colors.grey,
//                           activeColor: Colors.redAccent,
//                           value: _value)
//                     ],
//                   ),
//                 ),
//                 Spacer(),
//                 SizedBox(height: 15),
//                 Container(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         height: 170,
//                         width: 170,
//                         decoration: BoxDecoration(
//                           color: Color(0xff1D1F33),
//                           shape: BoxShape.rectangle,
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         child: Column(
//                           children: [
//                             SizedBox(height: 20),
//                             Text("WEIGHT",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 23,
//                                     color: Color(0xff868892))),
//                             // Text(
//                             //   '$_counter',
//                             //   style: Theme.of(context).textTheme.headline4,
//                             // ),
//                             TextField(
//                               controller: weightInput,
//                               decoration: InputDecoration(                             
                                
//                                 hintText: '74',
//                                 hintStyle: TextStyle(color: Colors.grey, fontSize: 40),
//                                 contentPadding: EdgeInsets.all(0),

//                               ),
//                             ),
//                             Container(
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   FloatingActionButton(
//                                     onPressed: () => _decrementCounter(weightInput.text),
//                                     tooltip: "Decrement",
//                                     backgroundColor: Color(0xff1C1F32),
//                                     child: Icon(Icons.remove),
//                                   ),
//                                   SizedBox(width: 7),
//                                   FloatingActionButton(
//                                     onPressed: () => _incrementCounter(weightInput.text),
//                                     tooltip: "Increment",
//                                     backgroundColor: Color(0xff1C1F32),
//                                     child: Icon(Icons.add),
//                                   )
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       SizedBox(width: 7),
//                       Container(
//                         height: 170,
//                         width: 170,
//                         decoration: BoxDecoration(
//                           color: Color(0xff1D1F33),
//                           shape: BoxShape.rectangle,
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         child: Column(
//                           children: [
//                             SizedBox(height: 20),
//                             Text("AGE",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 23,
//                                     color: Color(0xff868892))),
//                             Text(
//                               '$_age',
//                               style: Theme.of(context).textTheme.headline4,
//                             ),
//                             Container(
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   FloatingActionButton(
//                                     onPressed: () => _decrementCounter(weightInput.text),
//                                     tooltip: "Decrement",
//                                     backgroundColor: Color(0xff1C1F32),
//                                     child: Icon(Icons.remove),
//                                   ),
//                                   SizedBox(width: 7),
//                                   FloatingActionButton(
//                                     onPressed: () => _incrementCounter(weightInput.text),
//                                     tooltip: "Increment",
//                                     backgroundColor: Color(0xff1C1F32),
//                                     child: Icon(Icons.add),
//                                   )
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 60,
//                 ),
//                 SizedBox(
//                   height: 45,
//                   width: 500,
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     style: ButtonStyle(
//                         backgroundColor:
//                             MaterialStateProperty.all(Color(0xffEB1555))),
//                     // color: Color(0xffEB1555),
//                     child: Text("CALCULATE YOUR BMI",
//                         style: TextStyle(color: Colors.white)),
//                   ),
//                 )
//               ]),
//             ),
//           )),
//     );
//   }
// }
