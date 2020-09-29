import 'package:flutter/material.dart';
import 'package:chatApp/widget/widget.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController userNameTEC = new TextEditingController();
  TextEditingController emailTEC = new TextEditingController();
  TextEditingController passwordTEC = new TextEditingController();

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
                controller: userNameTEC,
                style: simpleTextStyle(),
                decoration: textFieldInputDecoration('User Name'),
              ),
              TextField(
                controller: emailTEC,
                style: simpleTextStyle(),
                decoration: textFieldInputDecoration('Email'),
              ),
              TextField(
                controller: passwordTEC,
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
                child: Text('Sign Up', style: simpleTextStyle()),
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
                  'Sign Up With Google',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("Already have an account ? ", style: simpleTextStyle()),
                Text(
                  ' Sign In Now',
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

class Colours {}
