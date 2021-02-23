import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:greylux_mobile/styleSheet.dart';

class AllInvestmentsListCard extends StatelessWidget {
  final dynamic data;

  const AllInvestmentsListCard({Key key, this.data});
  @override
  Widget build(BuildContext context) {
    dynamic deviceWidth;
    dynamic deviceHeight;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Container(
        width: deviceWidth * 0.8,
        margin: EdgeInsets.only(left: 15, top: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.amber.withOpacity(0.1),
            // border: Border.all(
            //   color: Colors.red[500],
            // ),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Countup(
                  begin: 0,
                  end: data['amount_invested'].toDouble(),
                  prefix: new String.fromCharCodes(new Runes('\u0024')),
                  duration: Duration(seconds: 3),
                  separator: ',',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20, fontFamily: numbers, color: border),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '> your investment capital',
                  style: TextStyle(
                      fontSize: 8, fontFamily: 'Muli', color: Colors.grey),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  '+',
                  style: TextStyle(
                      fontSize: 15, fontFamily: numbers, color: Colors.orange),
                ),
                Countup(
                  begin: 0,
                  end: data['interest_amount'].toDouble(),
                  prefix: new String.fromCharCodes(new Runes('\u0024')),
                  duration: Duration(seconds: 3),
                  separator: ',',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15, fontFamily: numbers, color: Colors.orange),
                ),
                Text(
                  '(${data['interest']})',
                  style: TextStyle(
                      fontSize: 15, fontFamily: numbers, color: Colors.orange),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '> your ROI: Return on investment',
                  style: TextStyle(
                      fontSize: 8, fontFamily: 'Muli', color: Colors.grey),
                )
              ],
            ),
            Divider(
              thickness: 1,
            ),
            Row(
              children: [
                Countup(
                  begin: 0,
                  end: data['roic'].toDouble(),
                  prefix: new String.fromCharCodes(new Runes('\u0024')),
                  duration: Duration(seconds: 3),
                  separator: ',',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: numbers,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '> ROI plus Capital',
                  style: TextStyle(
                      fontSize: 8, fontFamily: 'Muli', color: Colors.grey),
                )
              ],
            ),
            Text(
              'Due Date : ${data['due_date']}',
              style: TextStyle(
                  fontSize: 12, color: Colors.grey, fontFamily: 'Droid Sans'),
            ),
            Text(
              'Withdrawal takes between 3-5 working days.',
              style: TextStyle(
                  fontSize: 10, color: Colors.black, fontFamily: 'Muli'),
            ),
          ],
        ));
  }
}
