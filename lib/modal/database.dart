import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  getUserByUserName(String userName) async {
    return await Firestore.instance
        .collection("user")
        .where('name', isEqualTo: userName)
        .getDocuments();
  }

  uploadUserInfo(userMap) {
    Firestore.instance.collection("user").add(userMap);
  }
}
