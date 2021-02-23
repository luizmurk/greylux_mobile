import 'package:flutter/material.dart';
import 'package:greylux_mobile/controls/routes.dart';
import 'package:greylux_mobile/pages/chat.dart';
import 'package:greylux_mobile/pages/drawWallet.dart';
import 'package:greylux_mobile/pages/fundWallet.dart';
import 'package:greylux_mobile/pages/invest.dart';
import 'package:greylux_mobile/styleSheet.dart';
import 'package:greylux_mobile/ui_components/forms/bankDepositForm.dart';
import 'package:greylux_mobile/ui_components/forms/creditCardFundForm.dart';

class PullUpCardDraw extends StatefulWidget {
  final dynamic id;

  PullUpCardDraw({this.id});
  @override
  _PullUpCardDrawState createState() => _PullUpCardDrawState();
}

class _PullUpCardDrawState extends State<PullUpCardDraw> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    dynamic deviceWidth;
    dynamic deviceHeight;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SizedBox(
        //   height: 20,
        // ),
        // Text('Choose Withdraw Type',
        //     textAlign: TextAlign.left, style: menuLabel()),
        // SizedBox(
        //   height: 10,
        // ),
        // Container(
        //     height: deviceHeight * 0.082,
        //     width: deviceWidth * 1,
        //     padding: EdgeInsets.all(5),
        //     alignment: Alignment.centerLeft,
        //     decoration: BoxDecoration(
        //         color: white,
        //         borderRadius: BorderRadius.all(Radius.circular(10))),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Container(
        //             width: deviceWidth * 0.67,
        //             child: dropDownText('Withdraw to Bank Account')),
        //         Icon(
        //           Icons.arrow_drop_down,
        //           color: darkgrey,
        //           size: 34.0,
        //           semanticLabel: 'Text to announce in accessibility modes',
        //         ),
        //       ],
        //     )),
        // SizedBox(
        //   height: 20,
        // ),
        // Expanded(
        //   child:

        //)
      ],
    );
  }
}
