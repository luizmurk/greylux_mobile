import 'package:flutter/material.dart';
import 'package:greylux_mobile/styleSheet.dart';
import 'package:greylux_mobile/ui_components/forms/autoRenewTypeForm.dart';
import 'package:greylux_mobile/ui_components/investmentsList.dart';

class PullUpCardInvest extends StatefulWidget {
  final dynamic availableBalance;

  const PullUpCardInvest({Key key, this.availableBalance});
  @override
  _PullUpCardInvestState createState() => _PullUpCardInvestState();
}

class _PullUpCardInvestState extends State<PullUpCardInvest> {
  final formKey = GlobalKey<FormState>();
  final List fundTypes = [
    'Choose Plan',
    'Lumy Bronze Plan',
    'Lumy Silver Plan',
    'Lumy Gold Plan'
  ];
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
          //color: pullUpCardColor,
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
          Text('Choose Investment Type',
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
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              fundType = fundTypes[index];
                              showDropDown = false;
                            });
                          },
                          child: Container(
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
                              )),
                        );
                      })))
              : !showDropDown && fundType != 'Choose Plan'
                  ? Container(
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
                      child: fundType == 'Lumy Bronze Plan'
                          ? Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Bronze Plan',
                                    style: TextStyle(
                                        color: white,
                                        fontFamily: 'Muli',
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    '3 Investment cycle; 75 working days',
                                    style: TextStyle(
                                        color: white,
                                        fontFamily: 'Muli',
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    '40% Return on Interest',
                                    style: TextStyle(
                                        color: white,
                                        fontFamily: 'Muli',
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'Capital Range: \$100 to \$999.',
                                    style: TextStyle(
                                        color: white,
                                        fontFamily: 'Muli',
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            )
                          : fundType == 'Lumy Silver Plan'
                              ? Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Silver Plan',
                                        style: TextStyle(
                                            color: white,
                                            fontFamily: 'Muli',
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        '6 Investment cycle; 150 working days',
                                        style: TextStyle(
                                            color: white,
                                            fontFamily: 'Muli',
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        '85% Return on Interest',
                                        style: TextStyle(
                                            color: white,
                                            fontFamily: 'Muli',
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        'Capital Range: \$1000 to \$1999.',
                                        style: TextStyle(
                                            color: white,
                                            fontFamily: 'Muli',
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                )
                              : fundType == 'Lumy Gold Plan'
                                  ? Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Gold Plan',
                                            style: TextStyle(
                                                color: white,
                                                fontFamily: 'Muli',
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            '10 Investment cycle; 250 working days',
                                            style: TextStyle(
                                                color: white,
                                                fontFamily: 'Muli',
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            '130% Return on Interest',
                                            style: TextStyle(
                                                color: white,
                                                fontFamily: 'Muli',
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            'Capital Range: \$2000 to \$3000.',
                                            style: TextStyle(
                                                color: white,
                                                fontFamily: 'Muli',
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    )
                                  : SizedBox(
                                      height: 0,
                                    ),
                    )
                  : SizedBox(
                      height: 0,
                    ),
          SizedBox(
            height: 20,
          ),
          fundType != 'Choose Plan'
              ? AutoRenewTypeForm(
                  formKey: formKey,
                  plan: fundType,
                  bal: widget.availableBalance)
              : SizedBox(
                  height: 0,
                ),
          Text('Active Investment',
              textAlign: TextAlign.left, style: menuLabel()),
          InvestmentsList(),
          SizedBox(
            height: deviceHeight * 0.2,
          ),
        ],
      ),
    );
  }
}
