import 'package:bmi_calc/default_button.dart';
import 'package:bmi_calc/resultScreen.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BmiCalculator extends StatefulWidget {
  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  int currentindex = 0;
  double _value = 0;
  int _counter = 0;
  int _age = 0;
  bool _isMale = false;
  bool _isFemale = false;

  void _incrementCounter() {
    setState(() {
      _counter += 10;
    });
  }

  void _decrementCounter() {
    setState(
      () {
        if (_counter == 0) {
          return null;
        } else
          (_counter--);
      },
    );
  }

  void _incrementAge() {
    setState(() {
      if (_age == 100) {
        return null;
      } else
        (_age++);
    });
  }

  void _decrementAge() {
    setState(
      () {
        if (_age == 0) {
          return null;
        } else
          _age--;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0a0d22),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            'BMI CALCLULATOR',
            style: TextStyle(fontSize: 18),
          ),
        ),
        backgroundColor: Color(0xff0A0D22),
        elevation: 40,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Icon(
            Icons.sort,
            size: 35,
          ),
        ),
      ),
      body: SafeArea(
        bottom: true,
        left: true,
        right: true,
        top: true,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(4.0),
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              print(_isMale);
                              setState(
                                () {
                                  _isMale = true;
                                  _isFemale = false;
                                },
                              );
                            },
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height / 100 * 20,
                              width:
                                  MediaQuery.of(context).size.width / 100 * 45,
                              decoration: BoxDecoration(
                                  color: Color(0xff1D1F33),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              100 *
                                              2),
                                  IconTheme(
                                    data: IconThemeData(
                                      color: !_isMale
                                          ? Color(0xff8D8E98)
                                          : Colors.white,
                                      size: MediaQuery.of(context).size.width /
                                          100 *
                                          20,
                                    ),
                                    child: Icon(
                                      MdiIcons.genderMale,
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              100 *
                                              2),
                                  Text(
                                    'MALE',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: !_isMale
                                          ? Color(0xff8D8E98)
                                          : Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              print(_isFemale);
                              setState(
                                () {
                                  _isFemale = true;
                                  _isMale = false;
                                },
                              );
                            },
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height / 100 * 20,
                              width:
                                  MediaQuery.of(context).size.width / 100 * 45,
                              decoration: BoxDecoration(
                                  color: Color(0xff1D1F33),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              100 *
                                              2),
                                  RotationTransition(
                                    alignment: Alignment(0.4, -0.1),
                                    turns: new AlwaysStoppedAnimation(40 / 360),
                                    child: IconTheme(
                                      data: IconThemeData(
                                          color: !_isFemale
                                              ? Color(0xff8D8E98)
                                              : Colors.white,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              100 *
                                              24),
                                      child: Icon(MdiIcons.genderFemale),
                                    ),
                                  ),
                                  // SizedBox(height: MediaQuery.of(context).size.height / 100 * 0),
                                  Text(
                                    'FEMALE',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: !_isFemale
                                          ? Color(0xff8D8E98)
                                          : Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 17,
                ),
                height: MediaQuery.of(context).size.height / 100 * 23,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xff1D1F33).withOpacity(0.50),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 100 * 2,
                    ),
                    Text(
                      'HEIGHT',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Color(0xff8D8E98),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: ('${(_value).round()}'),
                                style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              TextSpan(
                                text: ('cm '),
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff8D8E98)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        showValueIndicator: ShowValueIndicator.always,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 24.0,
                        ),
                        trackHeight: 1.5,
                      ),
                      child: Slider(
                        value: _value,
                        min: 0,
                        max: 300.0,
                        onChanged: (double newValue) {
                          setState(
                            () {
                              _value = newValue;
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 100 * 24,
                      width: MediaQuery.of(context).size.width / 100 * 45,
                      decoration: BoxDecoration(
                        color: Color(0xff1D1F33).withOpacity(0.50),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 18),
                          Text("WEIGHT",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Color(0xff8D8E98))),
                          Text('$_counter',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 60,
                                  color: Colors.white)),
                                  SizedBox(height: 5),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: _decrementCounter,
                                  tooltip: "Decrement",
                                  backgroundColor: Color(0xff1C1F32),
                                  child: Icon(Icons.remove, size: 40),
                                ),
                                SizedBox(width: 15),
                                FloatingActionButton(
                                  onPressed: _incrementCounter,
                                  tooltip: "Increment",
                                  backgroundColor: Color(0xff1C1F32),
                                  child: Icon(Icons.add, size: 40),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 7),
                    Container(
                      height: MediaQuery.of(context).size.height / 100 * 24,
                      width: MediaQuery.of(context).size.width / 100 * 45,
                      decoration: BoxDecoration(
                        color: Color(0xff1D1F33).withOpacity(0.50),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Text("AGE",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Color(0xff8D8E98))),
                          Text(
                            '$_age',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 60,
                                color: Colors.white),
                          ),
                            SizedBox(height: 5),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: _decrementAge,
                                  tooltip: "Decrement",
                                  backgroundColor: Color(0xff1C1F32),
                                  child: Icon(
                                    Icons.remove,
                                    size: 40,
                                  ),
                                ),
                                SizedBox(width: 15),
                                FloatingActionButton(
                                  onPressed: _incrementAge,
                                  tooltip: "Increment",
                                  backgroundColor: Color(0xff1C1F32),
                                  child: Icon(Icons.add, size: 40),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 22,
              ),
              // DefualtButton(
              //   text: "CALCULATE YOUR BMI",
              //   press: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (BuildContext context) => ResultScreen(),
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: DefualtButton(
                text: "CALCULATE YOUR BMI",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => ResultScreen(),
                    ),
                  );
                },
              ),
    );
  }
}
