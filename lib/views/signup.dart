import 'package:chatApp/modal/database.dart';
import 'package:chatApp/services/auth.dart';
import 'package:chatApp/views/chatRoom.dart';
import 'package:flutter/material.dart';
import 'package:chatApp/widget/widget.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isLoading = false;
  AuthMethods authMethods = new AuthMethods();
  Database database = new Database();
  final formKey = GlobalKey<FormState>();
  TextEditingController userNameTEC = new TextEditingController();
  TextEditingController emailTEC = new TextEditingController();
  TextEditingController passwordTEC = new TextEditingController();

  singUp() async {
    if (formKey.currentState.validate()) {
      Map<String, String> userInforMap = {
        "name": userNameTEC.text,
        "email": emailTEC.text
      };
      setState(() {
        isLoading = true;
      });
      authMethods
          .signUpWithEmail(emailTEC.text, passwordTEC.text)
          .then((value) {
        database.uploadUserInfo(userInforMap);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ChatRoom(),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
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
                              return val.isEmpty || val.length < 2
                                  ? "Please Enter Your Name"
                                  : null;
                            },
                            controller: userNameTEC,
                            style: simpleTextStyle(),
                            decoration: textFieldInputDecoration('User Name'),
                          ),
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text('Forgot Password', style: simpleTextStyle()),
                    ),
                    SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        singUp();
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
                        child: Text('Sign Up', style: simpleTextStyle()),
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
                        'Sign Up With Google',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text("Already have an account ? ",
                          style: simpleTextStyle()),
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
