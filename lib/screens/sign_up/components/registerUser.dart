import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:greylux_mobile/data_management/databases.dart';
import 'package:greylux_mobile/styleSheet.dart';

class RegisterUser extends StatefulWidget {
  final String username;
  final int email;
  final int password;
  final dynamic formData;
  final formkey;

  RegisterUser(
      this.username, this.email, this.password, this.formkey, this.formData);

  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  @override
  Widget build(BuildContext context) {
    dynamic deviceWidth;
    dynamic deviceHeight;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;

    Future<void> registerUser() {
      // Call the user's CollectionReference to add a new user
      return cards
          .add({
            'number': widget.username, // John Doe
            'date': widget.email, // Stokes and Sons
            'cvv': widget.password // 42
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: .0),
      child: GestureDetector(
        onTap: () {
          print('Submitting form');
          if (this.widget.formkey.currentState.validate()) {
            this.widget.formkey.currentState.save(); //onSaved is called!
            print(widget.formData);
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text('Processing Data')));
            registerUser();
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text('Done Processing Data')));
          }
        },
        child: Container(
          width: deviceWidth * 1,
          alignment: Alignment.center,
          height: deviceHeight * 0.07,
          decoration: BoxDecoration(
              color: scaffoldColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 2.0, // soften the shadow
                  spreadRadius: 1, //extend the shadow
                  offset: Offset(
                    2.0, // Move to right 10  horizontally
                    5.0, // Move to bottom 5 Vertically
                  ),
                )
              ],
              borderRadius: BorderRadius.all(Radius.circular(50))),
          child: buttonTextReal('Fund with Card'),
        ),
      ),
    );
  }
}

// onPressed: () {
//             print('Submitting form');
//             if (this.widget.formkey.currentState.validate()) {
//               this.widget.formkey.currentState.save(); //onSaved is called!
//               print(widget.formData);
//               Scaffold.of(context)
//                   .showSnackBar(SnackBar(content: Text('Processing Data')));
//               RegisterUser();
//               Scaffold.of(context).showSnackBar(
//                   SnackBar(content: Text('Done Processing Data')));
//             }
//           },
