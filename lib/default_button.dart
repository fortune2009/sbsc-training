import 'package:flutter/material.dart';

class DefualtButton extends StatelessWidget {
  const DefualtButton({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: (60),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        color: Color(0xffeb1555),
        onPressed: press,
        child: Text(
          text,
          style:
              TextStyle(fontSize: (20), color: Colors.white, letterSpacing: 3),
        ),
      ),
    );
  }
}
