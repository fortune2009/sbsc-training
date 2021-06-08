import 'package:flutter/material.dart';

class PageTwo extends StatefulWidget {
  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:  Center(
          child: Hero(
            tag: "HeroOne",
            child: const Icon(
              Icons.image,
              size: 140.0,
            ),
          ),
        ),
      ),
    );
  }
}
