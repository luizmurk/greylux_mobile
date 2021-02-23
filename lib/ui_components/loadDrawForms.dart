import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:greylux_mobile/data_management/databases.dart';
import 'package:greylux_mobile/ui_components/availableBalance.dart';
import 'package:greylux_mobile/ui_components/availableBalanceSub.dart';
import 'package:greylux_mobile/ui_components/forms/bankDepositForm.dart';
import 'package:greylux_mobile/ui_components/pullUpCardDraw.dart';
import 'package:greylux_mobile/ui_components/pullUpCardFund.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadDrawForms extends StatefulWidget {
  @override
  _LoadDrawFormsState createState() => _LoadDrawFormsState();
}

class _LoadDrawFormsState extends State<LoadDrawForms> {
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
    id = prefs.getString('userID');
    availableBalance = prefs.getDouble('availableBalance');
    // userCredentials
    //     .where('userID', isEqualTo: id)
    //     .get()
    //     .then((QuerySnapshot querySnapshot) {
    //   querySnapshot.docs.forEach((result) {
    //     print(result.id);
    //     dataMap = result.data();
    //     print('fetched data here');
    //     print(dataMap);
    //     //id = result.id;
    //   });
    setState(() {
      loading = false;
    });
    // });
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return loading
        ? Center(
            child: Text(
            'Loading...',
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ))
        : ListView(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream:
                    userCredentials.where('userID', isEqualTo: id).snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
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
              BankDepositForm(formKey: formKey, id: id),
            ],
          );
  }
}

// ListTile(
//     title: new Text(document.data()['number'].toString()),
//     subtitle: new Text(document.data()['date'].toString()),
//   )
