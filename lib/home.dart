import 'package:flutter/material.dart';
import 'package:greylux_mobile/styleSheet.dart';
import 'package:greylux_mobile/ui_components/allInvestments.dart';
import 'package:greylux_mobile/ui_components/allInvestmentsListCard.dart';
import 'package:greylux_mobile/ui_components/availableBalance.dart';
import 'package:greylux_mobile/ui_components/form.dart';
import 'package:greylux_mobile/ui_components/header.dart';
import 'package:greylux_mobile/ui_components/noInvestment.dart';
import 'package:greylux_mobile/ui_components/pullUpCard.dart';
import 'package:greylux_mobile/ui_components/savedCardsList.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:greylux_mobile/data_management/databases.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.userId}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String userId;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  dynamic dataMap;
  dynamic id;
  dynamic userID;
  bool loading;
  dynamic availableBalance;
  dynamic investment_status;
  dynamic hasMessage;
  bool hasUpdated;
  dynamic updates;
  SharedPreferences prefs;
  int version = 1;

  void initState() {
    super.initState();
    loading = true;
    hasUpdated = true;
    getUserDetails();
  }

  Future<Map<String, dynamic>> getUserDetails() async {
    prefs = await SharedPreferences.getInstance();
    userID = prefs.getString('userID');
    userCredentials
        .where('userID', isEqualTo: userID)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print(result.id);
        dataMap = result.data();
        print('data here');
        print(dataMap);
        id = result.id;
      });
      availableBalance = dataMap['availableBalance'];
      investment_status = dataMap['investment_status'];
      hasMessage = dataMap['hasMessage'];
      prefs.setDouble('availableBalance', availableBalance);
      prefs.setString('userDocId', id);
      prefs.setString('status', investment_status);
      // userCredentials.doc(id).snapshots().listen((data) {
      //   print('change occured');
      //   print(data);
      // });
      // updates.get().then((QuerySnapshot querySnapshot) {
      //   querySnapshot.docs.forEach((doc) {
      //     print('update here');
      //     print(doc.data());
      //     var data = doc.data();
      //     print(data['seen']);
      //     updates = data['updated'];
      //     if (data['seen'].contains(userID)) {
      //       print('found');
      //       if (data['updated'].contains(userID)) {
      //         print('found');
      //         setState(() {
      //           loading = false;
      //         });
      //       } else {
      //         print('notFound');
      //         setState(() {
      //           loading = false;
      //           hasUpdated = false;
      //         });
      //       }
      //     } else {
      //       data['seen'].add(userID);
      //       updates.doc('log1').update({'seen': data['seen']}).then((value) {
      //         setState(() {
      //           loading = false;
      //           hasUpdated = false;
      //           Scaffold.of(context)
      //               .showSnackBar(SnackBar(content: Text('${data['logs']}')));
      //         });
      //       }).catchError((error) {
      //         Scaffold.of(context)
      //             .showSnackBar(SnackBar(content: Text('An error occured')));
      //       });
      //     }
      //   });
      // });
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: scaffoldColor,
        body: loading
            ? Center(
                child: Text(
                'Loading...',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 13,
                  ),
                  Header(
                      userId: userID,
                      hasUpdated: hasUpdated,
                      updates: updates,
                      version: version),
                  //Listen for funds change.
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
                        return Center(
                            child: Text(
                          '',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ));
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
                          availableBalance =
                              document.data()['availableBalance'];
                          investment_status =
                              document.data()['investment_status'];
                          hasMessage = document.data()['hasMessage'];
                          prefs.setDouble('availableBalance', availableBalance);
                          prefs.setString('userDocId', id);
                          prefs.setString('status', investment_status);
                          return new AvailableBalance(
                              balance: availableBalance);
                        }).toList(),
                      );
                    },
                  ),
                  //AvailableBalance(balance: availableBalance),
                  //Text('Active Investment'),
                  // investment_status == 'inactive'
                  //     ? NoInvestments()
                  //     :
                  StreamBuilder<QuerySnapshot>(
                    stream: investments
                        .where('userID', isEqualTo: userID)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something went wrong');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                            child: Text(
                          '',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ));
                      }

                      if (snapshot.hasData && snapshot.data.docs.isEmpty) {
                        return NoInvestments();
                      }

                      return Expanded(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            new Row(
                              children: snapshot.data.docs
                                  .map((DocumentSnapshot document) {
                                print('docs here');
                                //print(document.reference.id);
                                print(document.data());
                                return new AllInvestmentsListCard(
                                  data: document.data(),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 10,
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
                        return Center(
                            child: Text(
                          '',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ));
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
                          hasMessage = document.data()['hasMessage'];
                          return new PullUpCard(
                            notify: hasMessage,
                          );
                        }).toList(),
                      );
                    },
                  ),
                  // PullUpCard(
                  //   notify: hasMessage,
                  // )
                ],
              ));
  }
}
