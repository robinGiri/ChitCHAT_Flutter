import 'package:flutter/material.dart';

Widget appBarMain(BuildContext context) {
  final data = 'ChitCHAT';
  return AppBar(
    title: Center(child: Text(data)),
  );
}

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(color: Colors.white54),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
    ),
  );
}

TextStyle simpleTextStyle() {
  return TextStyle(color: Colors.white);
}
