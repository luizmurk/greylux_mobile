import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:greylux_mobile/data_management/databases.dart';
import 'package:greylux_mobile/styleSheet.dart';
import 'package:greylux_mobile/ui_components/availableBalance.dart';
import 'package:greylux_mobile/ui_components/availableBalanceSub.dart';
import 'package:greylux_mobile/ui_components/forms/creditCardFundForm.dart';
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
  dynamic userID;
  final formKey = GlobalKey<FormState>();
  void initState() {
    super.initState();
    loading = true;
    getUserCredentials();
  }

  Future<Map<String, dynamic>> getUserCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userID = prefs.getString('userID');
    availableBalance = prefs.getDouble('availableBalance');

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    dynamic deviceWidth;
    dynamic deviceHeight;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return loading
        ? Center(
            child: Text(
            'Loading...',
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ))
        : ListView(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: userCredentials
                    .where('userID', isEqualTo: userID)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: Text(''));
                  }

                  if (snapshot.hasData && snapshot.data.docs.isEmpty) {
                    return Center(
                        child: Column(
                      children: [
                        SizedBox(
                          height: 85,
                        ),
                        Icon(
                          Icons.app_blocking,
                          color: Colors.grey,
                          size: 35.0,
                          semanticLabel:
                              'Text to announce in accessibility modes',
                        ),
                        Text(
                          'You\'ve not made any transaction',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ));
                  }

                  return new Column(
                    children:
                        snapshot.data.docs.map((DocumentSnapshot document) {
                      print('docs here');
                      print('rebuilt');
                      print(document.data());
                      dataMap = document.data();
                      return new AvailableBalanceSub(
                          balance: dataMap['availableBalance']);
                    }).toList(),
                  );
                },
              ),
              StreamBuilder<QuerySnapshot>(
                stream: userCredentials
                    .where('userID', isEqualTo: userID)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: Text(''));
                  }

                  if (snapshot.hasData && snapshot.data.docs.isEmpty) {
                    return Center(
                        child: Column(
                      children: [
                        SizedBox(
                          height: 85,
                        ),
                        Icon(
                          Icons.app_blocking,
                          color: Colors.grey,
                          size: 35.0,
                          semanticLabel:
                              'Text to announce in accessibility modes',
                        ),
                        Text(
                          'You\'ve not made any transaction',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ));
                  }

                  return new Column(
                    children:
                        snapshot.data.docs.map((DocumentSnapshot document) {
                      print('docs here');
                      print('rebuilt');
                      print(document.data());
                      dataMap = document.data();
                      id = document.id;
                      return new Container(
                          padding: EdgeInsets.all(30),
                          child: CreditCardForm(
                              formKey: formKey, data: dataMap, id: id));
                    }).toList(),
                  );
                },
              ),
            ],
          );
  }
}

// ListTile(
//     title: new Text(document.data()['number'].toString()),
//     subtitle: new Text(document.data()['date'].toString()),
//   )
