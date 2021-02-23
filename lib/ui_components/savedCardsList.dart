import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:greylux_mobile/data_management/databases.dart';

class SavedCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: cards.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return new ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            return new ListTile(
              title: new Text(document.data()['number'].toString()),
              subtitle: new Text(document.data()['date'].toString()),
            );
          }).toList(),
        );
      },
    );
  }
}
