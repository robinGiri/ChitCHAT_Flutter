import 'package:flutter/material.dart';
import 'package:chatApp/widget/widget.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                style: simpleTextStyle(),
                decoration: textFieldInputDecoration('Email'),
              ),
              TextField(
                style: simpleTextStyle(),
                decoration: textFieldInputDecoration('Password'),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text('Forgot Password', style: simpleTextStyle()),
              ),
              SizedBox(height: 8),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      const Color(0xff007ef4),
                      const Color(0xff2A75BC)
                    ]),
                    borderRadius: BorderRadius.circular(30)),
                child: Text('Sign In', style: simpleTextStyle()),
              ),
              SizedBox(height: 8),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  'Sign In With Google',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("Don't have an account ? ", style: simpleTextStyle()),
                Text(
                  ' Register now',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      decoration: TextDecoration.underline),
                ),
              ]),
              SizedBox(height: 55),
            ],
          ),
        ),
      ),
    );
  }
}
