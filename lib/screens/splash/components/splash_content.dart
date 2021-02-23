import 'package:flutter/material.dart';
import 'package:greylux_mobile/styleSheet.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          "LumyVest",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color: Colors.lightBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          width: 300,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontFamily: 'Muli'),
          ),
        ),
        Spacer(flex: 2),
        Image.asset(image,
            height: getProportionateScreenHeight(265),
            width: getProportionateScreenWidth(355),
            fit: BoxFit.fitWidth),
      ],
    );
  }
}
