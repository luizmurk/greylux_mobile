import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:greylux_mobile/styleSheet.dart';

class AvailableBalanceSub extends StatelessWidget {
  final dynamic balance;

  const AvailableBalanceSub({
    Key key,
    this.balance = 0.0,
  });
  @override
  Widget build(BuildContext context) {
    dynamic deviceWidth;
    dynamic deviceHeight;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      height: deviceHeight * 0.07,
      width: deviceWidth * 0.8,
      //color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'AVAILABLE BALANCE',
            style: balanceLabels(),
          ),
          SizedBox(
            height: 3,
          ),
          Container(
            child: Countup(
              begin: 0,
              end: balance,
              prefix: new String.fromCharCodes(new Runes('\u0024')),
              duration: Duration(seconds: 3),
              separator: ',',
              textAlign: TextAlign.center,
              style: walletPrize(),
            ),
          ),
          // Text(
          //   '$balance',
          //   style: walletPrize(),
          // ),
        ],
      ),
    );
  }
}
