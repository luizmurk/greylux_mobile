import 'package:flutter/material.dart';
import 'package:greylux_mobile/styleSheet.dart';

class InvestmentListCard extends StatelessWidget {
  final dynamic date;
  final int amount;
  final String type;
  final String typeDetails;

  const InvestmentListCard(
      {Key key, this.date, this.amount, this.type, this.typeDetails});
  @override
  Widget build(BuildContext context) {
    dynamic deviceWidth;
    dynamic deviceHeight;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Container(
        width: deviceWidth * 0.5,
        margin: EdgeInsets.only(left: 15),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: white.withOpacity(0.1),
            // border: Border.all(
            //   color: Colors.red[500],
            // ),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '1,430.00',
              style:
                  TextStyle(fontSize: 20, fontFamily: numbers, color: border),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                '+1,000.00 (20%)',
                style:
                    TextStyle(fontSize: 15, fontFamily: numbers, color: orange),
              ),
            ),
            Divider(
              thickness: 1,
            ),
            Text(
              '1,430.00',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: numbers,
                  color: white),
            ),
            Text(
              'Due: 21st May 2020',
              style: TextStyle(fontSize: 12, color: darkgrey),
            ),
          ],
        ));
  }
}
