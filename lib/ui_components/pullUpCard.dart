import 'package:flutter/material.dart';
import 'package:greylux_mobile/chatImport/models/message_model.dart';
import 'package:greylux_mobile/chatImport/screens/chat_screen.dart';
import 'package:greylux_mobile/controls/routes.dart';
import 'package:greylux_mobile/home.dart';
import 'package:badges/badges.dart';
import 'package:greylux_mobile/pages/drawWallet.dart';
import 'package:greylux_mobile/pages/fundWallet.dart';
import 'package:greylux_mobile/pages/invest.dart';
import 'package:greylux_mobile/pages/investmentHistory.dart';
import 'package:greylux_mobile/pages/transactionHistory.dart';
import 'package:greylux_mobile/styleSheet.dart';
import 'package:greylux_mobile/ui_components/loadChat.dart';

class PullUpCard extends StatefulWidget {
  final dynamic notify;

  PullUpCard({this.notify});
  @override
  _PullUpCardState createState() => _PullUpCardState();
}

class _PullUpCardState extends State<PullUpCard> {
  @override
  Widget build(BuildContext context) {
    dynamic deviceWidth;
    dynamic deviceHeight;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      height: deviceHeight * 0.447,
      width: deviceWidth * 1,
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.0),
          // border: Border.all(
          //   color: Colors.red[500],
          // ),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      goTo(InvestPage(), context);
                    },
                    child: Container(
                      height: deviceHeight * 0.082,
                      width: deviceWidth * 0.17,
                      padding: EdgeInsets.all(10),
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
                      child: Container(
                          decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        image: new DecorationImage(
                          image: AssetImage('assets/icons/investIcon.png'),
                          fit: BoxFit.fitHeight,
                        ),
                        // border: Border.all(
                        //   color: Colors.red[500],
                        // ),
                      )),
                    ),
                  ),
                  Container(
                      height: deviceHeight * 0.042,
                      width: deviceWidth * 0.12,
                      margin: EdgeInsets.only(top: 10),
                      child: Text('Invest Funds',
                          textAlign: TextAlign.center, style: menuLabel()))
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      goTo(FundPage(), context);
                    },
                    child: Container(
                      height: deviceHeight * 0.082,
                      width: deviceWidth * 0.17,
                      padding: EdgeInsets.all(10),
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
                      child: Container(
                          decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        image: new DecorationImage(
                          image: AssetImage('assets/icons/fundIcon.png'),
                          fit: BoxFit.fitHeight,
                        ),
                        // border: Border.all(
                        //   color: Colors.red[500],
                        // ),
                      )),
                    ),
                  ),
                  Container(
                      height: deviceHeight * 0.042,
                      width: deviceWidth * 0.12,
                      margin: EdgeInsets.only(top: 10),
                      child: Text('Fund Wallet',
                          textAlign: TextAlign.center, style: menuLabel()))
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      goTo(DrawFundsPage(), context);
                    },
                    child: Container(
                      height: deviceHeight * 0.082,
                      width: deviceWidth * 0.17,
                      padding: EdgeInsets.all(10),
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
                      child: Container(
                          decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        image: new DecorationImage(
                          image: AssetImage('assets/icons/drawIcon.png'),
                          fit: BoxFit.fitHeight,
                        ),
                        // border: Border.all(
                        //   color: Colors.red[500],
                        // ),
                      )),
                    ),
                  ),
                  Container(
                      height: deviceHeight * 0.042,
                      width: deviceWidth * 0.125,
                      margin: EdgeInsets.only(top: 10),
                      child: Text('Withdraw Funds',
                          textAlign: TextAlign.center, style: menuLabel()))
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      goTo(LoadChat(), context);
                    },
                    child: Badge(
                      badgeContent: widget.notify == 'yes'
                          ? Text(
                              '1',
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'ABeeZee'),
                            )
                          : Text(''),
                      showBadge: widget.notify == 'yes' ? true : false,
                      child: Container(
                        height: deviceHeight * 0.082,
                        width: deviceWidth * 0.17,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 2.0, // soften the shadow
                                spreadRadius: 1, //extend the shadow
                                offset: Offset(
                                  2.0, // Move to right 10 horizontally
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(200))),
                        child: Container(
                            decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          image: new DecorationImage(
                            image: AssetImage('assets/icons/chatIcon.png'),
                            fit: BoxFit.fitHeight,
                          ),
                          // border: Border.all(
                          //   color: Colors.red[500],
                          // ),
                        )),
                      ),
                    ),
                  ),
                  Container(
                      height: deviceHeight * 0.042,
                      width: deviceWidth * 0.12,
                      margin: EdgeInsets.only(top: 10),
                      child: Text('Chat Agent',
                          textAlign: TextAlign.center, style: menuLabel()))
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              goTo(TransactionHistoryPage(), context);
            },
            child: Container(
                height: deviceHeight * 0.082,
                width: deviceWidth * 1,
                padding: EdgeInsets.all(15),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: GestureDetector(
                    onTap: () {
                      goTo(TransactionHistoryPage(), context);
                    },
                    child: buttonText('TRANSACTION HISTORY'))),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              goTo(TransactionHistoryPage(), context);
            },
            child: Container(
                height: deviceHeight * 0.082,
                width: deviceWidth * 1,
                padding: EdgeInsets.all(15),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: GestureDetector(
                    onTap: () {
                      goTo(InvestmentHistoryPage(), context);
                    },
                    child: buttonText('INVESTMENT HISTORY'))),
          )
        ],
      ),
    );
  }
}
