import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:greylux_mobile/data_management/databases.dart';
import 'package:greylux_mobile/ui_components/listCardTransactionHistory.dart';
import 'package:greylux_mobile/ui_components/profileHeader.dart';
import 'package:greylux_mobile/ui_components/pullUpCardProfile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadUserProfile extends StatefulWidget {
  //final String documentId;

  // LoadUserProfile(this.documentId);

  @override
  _LoadUserProfileState createState() => _LoadUserProfileState();
}

class _LoadUserProfileState extends State<LoadUserProfile> {
  bool loading;
  dynamic dataMap;
  dynamic id;
  void initState() {
    super.initState();
    loading = true;
    getUserDetails();
  }

  Future<Map<String, dynamic>> getUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userID = prefs.getString('userID');
    users
        .where('userID', isEqualTo: userID)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print(result.id);
        dataMap = result.data();
        id = result.id;
      });
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Center(
            child: Text(
            'Loading...',
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ))
        : Column(
            children: [
              ProfileHeader(
                username: dataMap['username'],
                email: dataMap['email'],
              ),
              PullUpCardProfile(
                data: dataMap,
                id: id,
              )
            ],
          );
  }
}

// ListTile(
//     title: new Text(document.data()['number'].toString()),
//     subtitle: new Text(document.data()['date'].toString()),
//   )
