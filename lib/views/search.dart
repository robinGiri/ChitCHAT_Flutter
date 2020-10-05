import 'package:chatApp/modal/database.dart';
// import 'package:chatApp/views/signup.dart';
import 'package:chatApp/widget/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Database database = new Database();
  TextEditingController searchTEC = new TextEditingController();
  QuerySnapshot searchSnapshot;

  searchFunction() {
    database.getUserByUserName(searchTEC.text).then((val) {
      setState(() {
        searchSnapshot = val;
      });
    });
  }

  Widget searchList() {
    return searchSnapshot != null
        ? ListView.builder(
            itemCount: searchSnapshot.documents.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return SearchTiles(
                userEmail: searchSnapshot.documents[index].data["name"],
                userName: searchSnapshot.documents[index].data["email"],
              );
            })
        : Container();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              color: Color(0x45ffffff),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchTEC,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Type User Name',
                        hintStyle: TextStyle(color: Colors.white70),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      searchFunction();
                    },
                    child: Icon(Icons.search, size: 40.0, color: Colors.white),
                  )
                ],
              ),
            ),
            searchList(),
          ],
        ),
      ),
    );
  }
}

class SearchTiles extends StatelessWidget {
  final String userName;
  final String userEmail;
  SearchTiles({this.userEmail, this.userName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: simpleTextStyle(),
              ),
              Text(
                userEmail,
                style: simpleTextStyle(),
              )
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Text(
                "Message",
                style: simpleTextStyle(),
              ),
            ),
          )
        ],
      ),
    );
    // return ListTile(
    //   leading: Icon(
    //     Icons.person,
    //     size: 100,
    //   ),
    //   title: Text(userName),
    //   subtitle: Text(userEmail),
    // );
  }
}
