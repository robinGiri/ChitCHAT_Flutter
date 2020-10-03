import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  getUserByUserName(String userName) {}

  uploadUserInfo(userMap) {
    Firestore.instance.collection("user").add(userMap);
  }
}
