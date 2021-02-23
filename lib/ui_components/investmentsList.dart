import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:greylux_mobile/data_management/databases.dart';
import 'package:greylux_mobile/ui_components/allInvestmentsListCard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InvestmentsList extends StatefulWidget {
  @override
  _InvestmentsListState createState() => _InvestmentsListState();
}

class _InvestmentsListState extends State<InvestmentsList> {
  String id;
  bool loading;

  @override
  void initState() {
    getId();
  }

  Future<void> getId() async {
    loading = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString('userID');

    setState(() {
      loading = false;
    });
    //setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Center(child: CircularProgressIndicator())
        : StreamBuilder<QuerySnapshot>(
            stream: investments.where('userID', isEqualTo: id).snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              return new Column(
                children: snapshot.data.docs.map((DocumentSnapshot document) {
                  print('docs here');
                  //print(document.reference.id);
                  print(document.data());
                  return new AllInvestmentsListCard(
                    data: document.data(),
                  );
                }).toList(),
              );
            },
          );
  }
}

// ListTile(
//     title: new Text(document.data()['number'].toString()),
//     subtitle: new Text(document.data()['date'].toString()),
//   )
