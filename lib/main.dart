import 'package:flutter/material.dart';
import 'package:test_app/welcome.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BasicDesign(),
    );
  }
}

class BasicDesign extends StatefulWidget {
  @override
  _BasicDesignState createState() => _BasicDesignState();
}

class _BasicDesignState extends State<BasicDesign> {
  final _formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  bool isEmail = false;
  bool isPassword = false;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 150,
          ),
          Text(
            'Sign In',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 82,
          ),
          Text(
            'welcome back'.toUpperCase(),
            style: TextStyle(
                color: Colors.white, fontSize: 11, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: emailController,
                      autocorrect: true,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        alignLabelWithHint: true,
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Email address',
                        hintStyle: TextStyle(fontSize: 12),
                        suffixIcon: _getIconEmail()
                            ? Container(
                                margin: EdgeInsets.all(20),
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Icon(
                                  Icons.check,
                                  size: 12,
                                  color: Colors.white,
                                ),
                              )
                            : SizedBox(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          print('email is null');
                          return 'Please enter email address';
                        }
                        if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value) !=
                            true) {
                          return 'Field must be a valid email';
                        }
                        setState(() {
                          isEmail = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value);
                          print('$isEmail');
                        });
                        print('function ${_getIconEmail()}');
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passwordController,
                      autocorrect: true,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        alignLabelWithHint: true,
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Password',
                        hintStyle: TextStyle(fontSize: 12),
                        suffixIcon: _getIconPass()
                            ? Container(
                                margin: EdgeInsets.all(20),
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Icon(
                                  Icons.check,
                                  size: 12,
                                  color: Colors.white,
                                ),
                              )
                            : SizedBox(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        if (RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                .hasMatch(value) !=
                            true) {
                          return 'Include atleast one Capital, Symbol, Number';
                        }
                        setState(() {
                          isPassword = RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                              .hasMatch(value);
                        });
                        print('function pass ${_getIconPass()}');
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                            isLoading = true;
                              Duration(seconds: 5);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dashboard(
                                          email: emailController.text)));
                            });
                          }
                        },                      
                        child: _getAnimi()
                            ? AnimatedContainer(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircularProgressIndicator(
                                    backgroundColor: Colors.black87,
                                  ),
                                ),
                                duration: Duration(seconds: 3))
                            : Text('Sign In'),
                        style: ButtonStyle(backgroundColor: _getIconPass() ? Theme.of(context).elevatedButtonTheme.style : MaterialStateProperty.all(Colors.blueAccent.withOpacity(0.30)),
                    )),
                    SizedBox(
                      height: 28,
                    ),
                  ],
                ),
              )),
          Text(
            'Forgot Password?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            'Reset Password',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 10,
            ),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  bool _getIconEmail() {
    if (isEmail) {
      return isEmail;
    } else {
      return false;
    }
  }

  bool _getIconPass() {
    if (isPassword) {
      return isPassword;
    } else {
      return false;
    }
  }

  bool _getAnimi() {
    if (isLoading) {
      return isLoading;
    } else {
      return false;
    }
  }
}
