import 'package:chatApp/views/login.dart';
import 'package:chatApp/views/signup.dart';
import 'package:flutter/material.dart';

class AuthChecker extends StatefulWidget {
  @override
  _AuthCheckerState createState() => _AuthCheckerState();
}

class _AuthCheckerState extends State<AuthChecker> {
  bool isLogIn = true;

  void toggleView() {
    setState(() {
      isLogIn = !isLogIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLogIn) {
      return Login(toggleView);
    } else {
      return Signup(toggleView);
    }
  }
}
