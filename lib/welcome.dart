import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  final email;

  const Dashboard({Key key, this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var splitEmail = email.split('@');
    return Scaffold(
          body: Container(
        child: Center(child: Text('Dear ${splitEmail[0].toString().toUpperCase()} Welcome Onboard')),
      ),
    );
  }
}
