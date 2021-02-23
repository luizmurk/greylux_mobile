import 'package:flutter/material.dart';
import 'package:greylux_mobile/styleSheet.dart';

class ProfileHeader extends StatelessWidget {
  final String username;
  final String email;

  const ProfileHeader({Key key, this.username, this.email});
  @override
  Widget build(BuildContext context) {
    dynamic deviceWidth;
    dynamic deviceHeight;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Container(
        height: deviceHeight * 0.18,
        width: deviceWidth * 1,
        //color: white,
        child: Container(
          padding: EdgeInsets.all(15),
          //color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  height: deviceHeight * 0.23,
                  width: deviceWidth * 0.26,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 2.0, // soften the shadow
                          spreadRadius: 1, //extend the shadow
                          offset: Offset(
                            2.0, // Move to right 10  horizontally
                            2.0, // Move to bottom 5 Vertically
                          ),
                        )
                      ],
                      // image: new DecorationImage(
                      //   image: AssetImage('assets/icons/chat.png'),
                      //   fit: BoxFit.fitHeight,
                      // ),
                      // border: Border.all(
                      //   color: Colors.red[500],
                      // ),
                      borderRadius: BorderRadius.all(Radius.circular(200))),
                  child: Center(
                      child: Text(
                    '${username[0].toUpperCase()}',
                    style: TextStyle(
                        fontSize: 60,
                        fontFamily: 'ABeeZee',
                        fontWeight: FontWeight.bold,
                        color: white),
                  ))

                  // Icon(
                  //   Icons.add_a_photo,
                  //   color: darkgrey,
                  //   size: 35.0,
                  //   semanticLabel: 'Text to announce in accessibility modes',
                  // ),
                  //   Container(
                  //       decoration: BoxDecoration(
                  //     color: white,
                  //     image: new DecorationImage(
                  //       image: AssetImage('assets/icons/invest.png'),
                  //       fit: BoxFit.contain,
                  //     ),
                  //     // border: Border.all(
                  //     //   color: Colors.red[500],
                  //     // ),
                  //   )),
                  ),
              Container(
                height: deviceHeight * 0.15,
                width: deviceWidth * 0.55,
                // color: Colors.white,
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$username',
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.black,
                          fontFamily: 'Muli'),
                    ),
                    Text(
                      '$email',
                      style: TextStyle(
                          fontSize: 15, color: Colors.grey, fontFamily: 'Muli'),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
