import 'package:flutter/material.dart';
import 'package:greylux_mobile/styleSheet.dart';

class FundCardOptions extends StatelessWidget {
  final List<dynamic> list;

  const FundCardOptions({Key key, this.list});

  @override
  Widget build(BuildContext context) {
    dynamic deviceWidth;
    dynamic deviceHeight;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Container(
        width: deviceWidth * 0.56,
        //height: deviceHeight * 0.26,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: white,
            // border: Border.all(
            //   color: Colors.red[500],
            // ),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(list.length, (index) {
              return Container(
                  alignment: Alignment.centerRight,
                  width: deviceWidth * 0.66,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      // border: Border.all(
                      //   color: Colors.red[500],
                      // ),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Text('${list[index]}'));
            })));
  }
}
