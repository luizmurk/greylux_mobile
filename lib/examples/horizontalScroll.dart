import 'package:flutter/material.dart';
import 'package:greylux_mobile/styleSheet.dart';

class HorizontalScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    dynamic deviceWidth;
    dynamic deviceHeight;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      height: deviceHeight * 0.17,
      width: deviceWidth * 1,
      margin: EdgeInsets.only(left: deviceWidth * 0.1),
      color: white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 160.0,
            color: Colors.red,
            child: ListTile(
              // tileColor: Colors.black,
              title: Text('Aqua United'),
            ),
          );
        },
      ),
    );
  }
}
