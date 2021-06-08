import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_app/todo/views/hero_page_2.dart';

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:  Center(
          child: Hero(
            tag: "HeroOne",
            flightShuttleBuilder: (context, anim, flight, from, to) {
              final Hero toHero = to.widget;
              return FlipcardTransition(flipAnim: anim, child: toHero);
            },
            placeholderBuilder: (
                BuildContext context,
                Size heroSize,
                Widget child,
                ) {
              return const SizedBox(
                height: 150.0,
                width: 150.0,
                child: CircularProgressIndicator(),
              );
            },
            child: const Icon(
              Icons.image,
              size: 20.0,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(
          builder: (context) => PageTwo(),
        )),
        child: Icon(Icons.add),
      ),
    );
  }
}

class FlipcardTransition extends AnimatedWidget {
  final Animation<double> flipAnim;
  final Widget child;

  FlipcardTransition({@required this.flipAnim, @required this.child})
      : assert(flipAnim != null),
        assert(child != null),
        super(listenable: flipAnim);

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..rotateY(-pi * flipAnim.value),
      alignment: FractionalOffset.center,
      child: child,
    );
  }
}