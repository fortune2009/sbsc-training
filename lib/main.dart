import 'package:bmi_calc/body.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BmiCalc());
}

class BmiCalc extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //  theme: ThemeData(sliderTheme:  ),
      debugShowCheckedModeBanner: false,
      home: BmiCalculator(),

      // BmiCalculator(),
    );
  }
}
