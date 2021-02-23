import 'package:flutter/material.dart';
import 'package:greylux_mobile/controls/routes.dart';
import 'package:greylux_mobile/pages/chat.dart';
import 'package:greylux_mobile/pages/drawWallet.dart';
import 'package:greylux_mobile/pages/fundWallet.dart';
import 'package:greylux_mobile/pages/invest.dart';
import 'package:greylux_mobile/styleSheet.dart';
import 'package:greylux_mobile/ui_components/forms/creditCardFundForm.dart';
import 'package:greylux_mobile/ui_components/investmentList.dart';
import 'package:greylux_mobile/ui_components/investmentsHistoryList.dart';
import 'package:greylux_mobile/ui_components/investmentsList.dart';
import 'package:greylux_mobile/ui_components/transactionList.dart';

class PullUpCardInvestmentHistory extends StatefulWidget {
  @override
  _PullUpCardInvestmentHistoryState createState() =>
      _PullUpCardInvestmentHistoryState();
}

class _PullUpCardInvestmentHistoryState
    extends State<PullUpCardInvestmentHistory> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    dynamic deviceWidth;
    dynamic deviceHeight;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      height: deviceHeight * 0.88,
      width: deviceWidth * 1,
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
          //color: pullUpCardColor,
          // border: Border.all(
          //   color: Colors.red[500],
          // ),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text('All Your Investments',
              textAlign: TextAlign.left, style: menuLabel()),
          Expanded(child: InvestmentsHistoryList())
        ],
      ),
    );
  }
}
