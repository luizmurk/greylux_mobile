import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:greylux_mobile/styleSheet.dart';

class AvailableBalance extends StatelessWidget {
  final dynamic balance;

  const AvailableBalance({
    Key key,
    this.balance = 0.0,
  });
  @override
  Widget build(BuildContext context) {
    dynamic deviceWidth;
    dynamic deviceHeight;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    print('i was called');
    return Container(
      height: deviceHeight * 0.17,
      width: deviceWidth * 1,
      //color: white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'AVAILABLE BALANCE',
            style: balanceLabels2(),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Countup(
              begin: 0,
              end: balance,
              prefix: new String.fromCharCodes(new Runes('\u0024')),
              duration: Duration(seconds: 3),
              separator: ',',
              textAlign: TextAlign.center,
              style: walletPrize2(),
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
