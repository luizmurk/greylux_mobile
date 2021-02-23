import 'package:flutter/material.dart';
import 'package:greylux_mobile/constants.dart';
import 'package:greylux_mobile/controls/routes.dart';
import 'package:greylux_mobile/screens/otp/components/otp_form%20copy.dart';
import 'package:greylux_mobile/screens/sign_in/components/body.dart';
import 'package:greylux_mobile/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'otp_form.dart';

class OtpBody extends StatefulWidget {
  @override
  _OtpBodyState createState() => _OtpBodyState();
}

class _OtpBodyState extends State<OtpBody> {
  bool otpNotSecured = false;
  bool otpSecured = false;
  bool loading = false;
  bool passwordForgot = false;

  void initState() {
    super.initState();
    checking();
  }

  Future<String> check() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var otpSecured = prefs.getBool('otpSecured');
    if (otpSecured != null && !otpSecured) {
      print('you forgot to secure otp');
      print(otpSecured);
      return 'otpNotSecured';
    } else {
      print('you already secured otp');
      print(otpSecured);
      return 'otpSecured';
    }
  }

  checking() {
    print('checking');
    check().then((screen) {
      print('screen here');
      print(screen);
      if (screen == 'otpNotSecured') {
        setState(() {
          otpNotSecured = true;
        });
        // return OtpBody();
      } else if (screen == 'otpSecured') {
        setState(() {
          otpSecured = true;
        });
        //return SignInBody();
      } else {
        setState(() {
          loading = true;
        });
        //return Body();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return !passwordForgot
        ? SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: SizeConfig.screenHeight * 0.23),
                    Text(
                      "Pin Lock",
                      style: headingStyle,
                    ),
                    otpNotSecured
                        ? Text("Please enter a 4 digit App lock pin")
                        : otpSecured
                            ? Text("Please enter your 4 digit App lock pin")
                            : Text(''),
                    otpNotSecured
                        ? Text("that only you will remeber")
                        : otpSecured
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    passwordForgot = true;
                                  });
                                },
                                child: Container(
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.only(top: 15),
                                    color: Colors.lightBlue,
                                    child: Text(
                                      "Forgot My Pin",
                                      style: TextStyle(color: Colors.white),
                                    )),
                              )
                            : Text(''),
                    // buildTimer(),
                    otpNotSecured
                        ? OtpForm()
                        : otpSecured
                            ? OtpForm2()
                            : Center(
                                child: Text('Loading',
                                    style: TextStyle(color: Colors.black)),
                              ),
                    SizedBox(height: SizeConfig.screenHeight * 0.1),
                  ],
                ),
              ),
            ),
          )
        : SignInBody();
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: Duration(seconds: 30),
          builder: (_, value, child) => Text(
            "00:${value.toInt()}",
            style: TextStyle(color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
