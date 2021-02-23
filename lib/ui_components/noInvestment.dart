import 'package:flutter/material.dart';

class NoInvestments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    dynamic deviceWidth;
    dynamic deviceHeight;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      height: deviceHeight * 0.21,
      width: deviceWidth * 0.7,
      margin: EdgeInsets.only(left: deviceWidth * 0.14),
      child: Container(
          width: deviceWidth * 0.6,
          // margin: EdgeInsets.only(left: 15),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              //color: Colors.lightBlue.withOpacity(0.02),
              // border: Border.all(
              //   color: Colors.red[500],
              // ),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Center(
            child: Text(
              'You currently have no investment running, \n\nStart one by funding your account and choosing a plan by tapping the invest funds button below',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Monteserat',
                  color: Colors.black45,
                  letterSpacing: 2.0),
            ),
          )),
    );
  }
}
