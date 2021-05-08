import 'package:bmi_calc/body.dart';
import 'package:bmi_calc/default_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResultScreen extends StatelessWidget {
  String routeName = 'result_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0a0d22),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text('BMI CALCLULATOR'),
        ),
        backgroundColor: Color(0xff0A0D22),
        elevation: 40,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Icon(
            Icons.sort,
            size: 40,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Your Result',
                      style: TextStyle(
                          letterSpacing: 2,
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 100 * 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xff1D1F33),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            'NORMAL',
                            style: TextStyle(
                                letterSpacing: 1,
                                color: Color(0xff22E67B),
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '22.1',
                            style: TextStyle(
                                letterSpacing: 5,
                                color: Colors.white,
                                fontSize: 90,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Normal BMI Range:',
                            style: TextStyle(
                                letterSpacing: 2,
                                color: Color(0xff868792),
                                fontSize: 23,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '18,5 - 25 kg/m2',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            'You have a normal body\n weight. Good job!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                letterSpacing: 1,
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          SizedBox(
                            height: 75,
                            width: 270,
                            child: RaisedButton(
                              onPressed: () {  },
                              color: Color(0xff181a2e),
                              child: Text(
                                "SAVE RESULT",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                  letterSpacing: 2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 68,
            ),
          ],
        ),
      ),
      bottomNavigationBar: DefualtButton(
        text: "RE-CALCULATE YOUR BMI",
        press: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => BmiCalculator(),
            ),
          );
        },
      ),
    );
  }
}
