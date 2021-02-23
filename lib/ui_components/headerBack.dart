import 'package:flutter/material.dart';
import 'package:greylux_mobile/styleSheet.dart';

class HeaderBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    dynamic deviceWidth;
    dynamic deviceHeight;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 20),
      height: deviceHeight * 0.12,
      width: deviceWidth * 1,
      child: Container(
        margin: EdgeInsets.only(top: 35),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 24.0,
            semanticLabel: 'Text to announce in accessibility modes',
          ),
        ),
      ),
    );
  }
}
