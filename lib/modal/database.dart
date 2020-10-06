import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  getUserByUserName(String userName) async {
    return await Firestore.instance
        .collection("user")
        .where('name', isEqualTo: userName)
        .getDocuments();
  }

  getUserByEmail(String email) async {
    return await Firestore.instance
        .collection("user")
        .where('email', isEqualTo: email)
        .getDocuments();
  }

  uploadUserInfo(userMap) {
    Firestore.instance.collection("user").add(userMap).catchError((e) {
      print(e.toString());
    });
  }

  createChatRoom(String chatRoomId, chatRoomMap) {
    Firestore.instance
        .collection("chatRoom")
        .document(chatRoomId)
        .setData(chatRoomMap)
        .catchError((e) {
      print(e.toString());
    });
  }
}
