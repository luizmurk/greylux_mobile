import 'package:flutter/material.dart';
import 'package:greylux_mobile/styleSheet.dart';

class AllInvestments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    dynamic deviceWidth;
    dynamic deviceHeight;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      height: deviceHeight * 0.210,
      width: deviceWidth * 1,
      //margin: EdgeInsets.only(left: deviceWidth * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 15),
                        child: sectionHeader('All Investments')),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        width: deviceWidth * 0.5,
                        margin: EdgeInsets.only(left: 15),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: white.withOpacity(0.1),
                            // border: Border.all(
                            //   color: Colors.red[500],
                            // ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '1,430.00',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: numbers,
                                  color: border),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text(
                                '+1,000.00 (20%)',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: numbers,
                                    color: orange),
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
                        )),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
