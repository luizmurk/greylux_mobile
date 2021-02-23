import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:greylux_mobile/components/custom_surfix_iconUI.dart';
import 'package:greylux_mobile/controls/routes.dart';
import 'package:greylux_mobile/data_management/databases.dart';
import 'package:greylux_mobile/pages/profilePage.dart';
import 'package:greylux_mobile/styleSheet.dart';
//import 'package:greylux_mobile/components/custom_surfix_iconUI.dart';

class Header extends StatefulWidget {
  final String userId;
  final bool hasUpdated;
  final dynamic updates;
  final dynamic version;

  const Header(
      {Key key, this.userId, this.hasUpdated, this.updates, this.version});

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool load = false;
  @override
  Widget build(BuildContext context) {
    dynamic deviceWidth;
    dynamic deviceHeight;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    dynamic newVersion;
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 20),
      height: deviceHeight * 0.12,
      width: deviceWidth * 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 27),
            child: GestureDetector(
              onTap: () {
                goTo(ProfilePage(), context);
              },
              child:
                  //Icon(
                  //   Icons.supervised_user_circle,
                  //   color: darkgrey,
                  //   size: 34.0,
                  //   semanticLabel: 'Text to announce in accessibility modes',
                  // ),
                  CustomSurffixIconUi(svgIcon: "assets/icons/User2.svg"),
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: updates.snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: Text(
                  'Loading...',
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
                      semanticLabel: 'Text to announce in accessibility modes',
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
                children: snapshot.data.docs.map((DocumentSnapshot document) {
                  print('docs here');
                  print('rebuilt update');
                  print(document.data());
                  newVersion = document.data()['version'];
                  return newVersion != widget.version
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              load = true;
                              widget.updates.add(widget.userId);
                              widget.updates.doc('log1').update(
                                  {'updated': widget.updates}).then((value) {
                                // moves you to store.
                              }).catchError((error) {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text('An error occured')));
                              });
                            });
                          },
                          child: Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      top: deviceHeight * 0.06, right: 15),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'you\'re using an older version >',
                                    style: TextStyle(
                                        color: Colors.black45,
                                        //fontWeight: FontWeight.bold,
                                        fontSize: 8),
                                  )),
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                                margin: EdgeInsets.only(
                                    top: deviceHeight * 0.06, right: 15),
                                alignment: Alignment.center,
                                height: deviceHeight * 0.035,
                                child: Text(
                                  'UPDATE NOW',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 8),
                                ),
                              ),
                            ],
                          ),
                        )
                      : SizedBox();
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
