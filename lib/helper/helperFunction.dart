import 'package:shared_preferences/shared_preferences.dart';

class HelperFunction {
  static String userNameKey = "USERNAMEKEY";
  static String userLoggedInKey = "USERLOGGEDINKEY";
  static String userEmailKey = "USEREMAILKEY";

  static Future<bool> saveLoggedInUser(bool isUserLogin) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.setBool(userLoggedInKey, isUserLogin);
  }

  static Future<bool> saveUserName(String userName) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.setString(userNameKey, userName);
  }

  static Future<bool> saveEmail(String email) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.setString(userEmailKey, email);
  }

  static Future<bool> getLoggedInUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.getBool(userLoggedInKey);
  }

  static Future<String> getUserName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.getString(userNameKey);
  }

  static Future<String> getEmail() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.getString(userEmailKey);
  }
}
