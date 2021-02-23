import 'package:flutter/material.dart';
import 'package:greylux_mobile/styleSheet.dart';

class PullUpCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    dynamic deviceWidth;
    dynamic deviceHeight;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      height: deviceHeight * 0.467,
      width: deviceWidth * 1,
      decoration: BoxDecoration(
          color: white,
          // border: Border.all(
          //   color: Colors.red[500],
          // ),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(55), topRight: Radius.circular(55))),
    );
  }
}
