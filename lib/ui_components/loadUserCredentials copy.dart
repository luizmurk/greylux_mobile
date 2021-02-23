import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:greylux_mobile/data_management/databases.dart';
import 'package:greylux_mobile/ui_components/availableBalance.dart';
import 'package:greylux_mobile/ui_components/pullUpCardFund.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadUserCredentials extends StatefulWidget {
  //final String documentId;

  // LoadUserCredentials(this.documentId);

  @override
  _LoadUserCredentialsState createState() => _LoadUserCredentialsState();
}

class _LoadUserCredentialsState extends State<LoadUserCredentials> {
  bool loading;
  dynamic dataMap;
  dynamic id;
  dynamic availableBalance;
  void initState() {
    super.initState();
    loading = true;
    getUserCredentials();
  }

  Future<Map<String, dynamic>> getUserCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userID = prefs.getString('userID');
    availableBalance = prefs.getDouble('availableBalance');
    userCredentials
        .where('userID', isEqualTo: userID)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print(result.id);
        dataMap = result.data();
        print('fetched data here');
        print(dataMap);
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
              AvailableBalance(
                balance: availableBalance,
              ),
              PullUpCardFund(
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
