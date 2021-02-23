import 'package:flutter/material.dart';
import 'package:greylux_mobile/controls/routes.dart';
import 'package:greylux_mobile/pages/chat.dart';
import 'package:greylux_mobile/pages/drawWallet.dart';
import 'package:greylux_mobile/pages/fundWallet.dart';
import 'package:greylux_mobile/pages/invest.dart';
import 'package:greylux_mobile/styleSheet.dart';
import 'package:greylux_mobile/ui_components/forms/creditCardFundForm.dart';
import 'package:greylux_mobile/ui_components/forms/profileForm.dart';
import 'package:greylux_mobile/ui_components/loadProfileDetails.dart';

class PullUpCardProfile extends StatefulWidget {
  final dynamic data;
  final dynamic id;

  const PullUpCardProfile({Key key, this.data, this.id});

  @override
  _PullUpCardProfileState createState() => _PullUpCardProfileState();
}

class _PullUpCardProfileState extends State<PullUpCardProfile> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    dynamic deviceWidth;
    dynamic deviceHeight;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      height: deviceHeight * 0.7,
      width: deviceWidth * 1,
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
          color: pullUpCardColor,
          // border: Border.all(
          //   color: Colors.red[500],
          // ),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45))),
      child: ListView(
        children: [
          ProfileForm(
              formKey: formKey, data: this.widget.data, id: this.widget.id)
        ],
      ),
    );
  }
}
