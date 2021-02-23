import 'package:flutter/material.dart';
import 'package:greylux_mobile/controls/routes.dart';
import 'package:greylux_mobile/pages/chat.dart';
import 'package:greylux_mobile/pages/drawWallet.dart';
import 'package:greylux_mobile/pages/fundWallet.dart';
import 'package:greylux_mobile/pages/invest.dart';
import 'package:greylux_mobile/styleSheet.dart';
import 'package:greylux_mobile/ui_components/forms/creditCardFundForm.dart';
import 'package:greylux_mobile/ui_components/dropdownCards/fundCards.dart';

class PullUpCardFund extends StatefulWidget {
  final dynamic data;
  final dynamic id;

  const PullUpCardFund({Key key, this.data, this.id});
  @override
  _PullUpCardFundState createState() => _PullUpCardFundState();
}

class _PullUpCardFundState extends State<PullUpCardFund> {
  final formKey = GlobalKey<FormState>();
  final List fundTypes = ['Fund with Card'];
  String fundType;
  bool showDropDown;
  @override
  void initState() {
    super.initState();
    fundType = fundTypes[0];
    showDropDown = false;
  }

  @override
  Widget build(BuildContext context) {
    dynamic deviceWidth;
    dynamic deviceHeight;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      height: deviceHeight * 0.71,
      width: deviceWidth * 1,
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
          color: pullUpCardColor,
          // border: Border.all(
          //   color: Colors.red[500],
          // ),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45))),
      child: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Text('Choose Fund Type',
              textAlign: TextAlign.left, style: menuLabel()),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                showDropDown = !showDropDown;
              });
            },
            child: Container(
                height: deviceHeight * 0.082,
                width: deviceWidth * 1,
                padding: EdgeInsets.all(5),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: deviceWidth * 0.67,
                        child: dropDownText('$fundType')),
                    Icon(
                      Icons.arrow_drop_down,
                      color: darkgrey,
                      size: 34.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: 20,
          ),
          showDropDown
              ? Container(
                  width: deviceWidth * 0.56,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: List.generate(fundTypes.length, (index) {
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  fundType = fundTypes[index];
                                  showDropDown = false;
                                });
                              },
                              child: Text(
                                '${fundTypes[index]}',
                                style: TextStyle(
                                    color: white,
                                    fontFamily: 'Muli',
                                    fontWeight: FontWeight.w600),
                              ),
                            ));
                      })))
              : SizedBox(
                  height: 0,
                ),
          SizedBox(
            height: 20,
          ),
          fundType == 'Fund with Card'
              ? CreditCardForm(
                  formKey: formKey, data: widget.data, id: widget.id)
              : fundType == 'Fund from Bitcoin Wallet'
                  ? Text('Bitcoin form goes here')
                  : SizedBox(
                      height: 0,
                    ),
        ],
      ),
    );
  }
}
