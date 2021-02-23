import 'package:flutter/material.dart';
import 'package:greylux_mobile/components/default_button.dart';
import 'package:greylux_mobile/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:greylux_mobile/controls/routes.dart';

import '../../../constants.dart';
import '../../../home.dart';

class OtpForm2 extends StatefulWidget {
  const OtpForm2({
    Key key,
  }) : super(key: key);

  @override
  _OtpForm2State createState() => _OtpForm2State();
}

class _OtpForm2State extends State<OtpForm2> {
  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;

  final fieldTextOne = TextEditingController();
  final fieldTextTwo = TextEditingController();
  final fieldTextThree = TextEditingController();
  final fieldTextFour = TextEditingController();

  String one;
  String two;
  String three;
  String four;
  int pin;
  dynamic userId;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  Future<String> checkPin(pinNumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userPin = prefs.getInt('userPin');
    userId = prefs.getString('userID');

    if (userPin == pinNumber) {
      return 'success';
    } else {
      return 'failed';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  controller: fieldTextOne,
                  autofocus: true,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    print(value);
                    one = value;
                    nextField(value, pin2FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin2FocusNode,
                  controller: fieldTextTwo,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    print(value);
                    two = value;
                    nextField(value, pin3FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin3FocusNode,
                  controller: fieldTextThree,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    print(value);
                    three = value;
                    nextField(value, pin4FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin4FocusNode,
                  controller: fieldTextFour,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (value.length == 1) {
                      print(value);
                      four = value;
                      pin4FocusNode.unfocus();
                      print('pin here');
                      pin = int.parse('$one$two$three$four');
                      print(pin);
                      // Then you need to check is the code is correct or not
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          DefaultButton(
            text: "Continue",
            press: () {
              checkPin(pin).then((value) {
                if (value == 'success') {
                  goTo(
                      MyHomePage(
                        userId: userId,
                      ),
                      context);
                } else {
                  fieldTextOne.clear();
                  fieldTextTwo.clear();
                  fieldTextThree.clear();
                  fieldTextFour.clear();
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('You entered a wrong pin')));
                }
              });
            },
          )
        ],
      ),
    );
  }
}
