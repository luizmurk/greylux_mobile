import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:greylux_mobile/controls/routes.dart';
import 'package:greylux_mobile/data_management/databases.dart';
import 'package:greylux_mobile/pages/invest.dart';
import 'package:greylux_mobile/styleSheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AutoRenewInvest extends StatefulWidget {
  final dynamic formData;
  //final formKey;

  final formkey;

  AutoRenewInvest(this.formData, this.formkey);

  @override
  _AutoRenewInvestState createState() => _AutoRenewInvestState();
}

class _AutoRenewInvestState extends State<AutoRenewInvest> {
  dynamic bal;
  dynamic id;
  void initState() {
    super.initState();
    getBalance();
  }

  getBalance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bal = prefs.getDouble('availableBalance');
    id = prefs.getString('userID');
  }

  @override
  Widget build(BuildContext context) {
    dynamic deviceWidth;
    dynamic deviceHeight;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;

    Future<void> updateStatus(idUser) async {
      return userCredentials
          .doc(idUser)
          .update({'investment_status': 'active'})
          .then((value) {})
          .catchError((error) {});
    }

    Future<void> updateBalance() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var docID = prefs.getString('userDocId');
      var a = prefs.getDouble('availableBalance');
      var b = widget.formData['amount_invested'];
      var newBalance = a - b;
      print('new balance');
      print(newBalance);
      prefs.setDouble('availableBalance', newBalance);
      return userCredentials
          .doc(docID)
          .update({'availableBalance': newBalance}).then((value) {
        updateStatus(docID);
      }).catchError((error) {});
    }

    Future<void> invest() {
      widget.formData['userID'] = id;
      return investments.add(widget.formData).then((value) {
        print('the v here');
        print(value);
        creditList.add({
          'date': widget.formData['due_date'],
          'userID': id,
          'investmentId': value,
          'payment': widget.formData['roic'],
        }).then((value) {
          updateBalance();
        }).catchError((error) {});
      }).catchError((error) => print("Failed to add user: $error"));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: .0),
      child: GestureDetector(
        onTap: () {
          print('Submitting form');
          if (this.widget.formkey.currentState.validate()) {
            this.widget.formkey.currentState.save(); //onSaved is called!
            this.widget.formkey.currentState.reset();
            print(widget.formData);
            Scaffold.of(context).showSnackBar(SnackBar(
                backgroundColor: green,
                elevation: 10,
                behavior: SnackBarBehavior.floating,
                content: Text('Succesful Investment')));
            invest();
            // Scaffold.of(context)
            //     .showSnackBar(SnackBar(content: Text('Done Processing Data')));
          }
        },
        child: Container(
          //margin: EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
              color: Colors.lightBlue,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 2.0, // soften the shadow
                  spreadRadius: 1, //extend the shadow
                  offset: Offset(
                    1.0, // Move to right 10  horizontally
                    1.0, // Move to bottom 5 Vertically
                  ),
                )
              ],
              borderRadius: BorderRadius.all(Radius.circular(15))),
          alignment: Alignment.center,
          width: deviceWidth * 1,
          height: deviceHeight * 0.08,
          child: Text(
            'Invest',
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'ABeeZee', color: Colors.white),
          ),
        ),
      ),
    );
  }
}

// onPressed: () {
//
// },
