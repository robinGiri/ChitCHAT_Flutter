import 'package:chatApp/helper/helperFunction.dart';
import 'package:chatApp/modal/database.dart';
import 'package:chatApp/services/auth.dart';
import 'package:chatApp/views/chatRoom.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:chatApp/widget/widget.dart';

class Login extends StatefulWidget {
  final Function toggleView;
  Login(this.toggleView);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoading = false;
  AuthMethods authMethods = new AuthMethods();
  Database database = new Database();
  QuerySnapshot userInfoSnapshot;

  TextEditingController emailTEC = new TextEditingController();
  TextEditingController passwordTEC = new TextEditingController();
  final formKey = GlobalKey<FormState>();

  signIn() {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      database.getUserByEmail(emailTEC.text).then((val) {
        userInfoSnapshot = val;
        HelperFunction.saveEmail(userInfoSnapshot.documents[0].data["name"]);
      });

      authMethods
          .signInWithEmail(emailTEC.text, passwordTEC.text)
          .then((value) {
        if (value != null) {
          HelperFunction.saveLoggedInUser(true);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ChatRoom(),
            ),
          );
        }
      });
    }
  }

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
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (val) {
                        Pattern pattern =
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                        RegExp regex = new RegExp(pattern);
                        return regex.hasMatch(val)
                            ? null
                            : "Please Enter Valid Email";
                      },
                      controller: emailTEC,
                      style: simpleTextStyle(),
                      decoration: textFieldInputDecoration('Email'),
                    ),
                    TextFormField(
                      obscureText: true,
                      validator: (val) {
                        return val.isEmpty || val.length < 6
                            ? "Please Enter Password Greater Than 6 Length"
                            : null;
                      },
                      controller: passwordTEC,
                      style: simpleTextStyle(),
                      decoration: textFieldInputDecoration('Password'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text('Forgot Password', style: simpleTextStyle()),
              ),
              SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  signIn();
                },
                child: Container(
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
                GestureDetector(
                  onTap: () {
                    widget.toggleView();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      ' Register now',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          decoration: TextDecoration.underline),
                    ),
                  ),
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
