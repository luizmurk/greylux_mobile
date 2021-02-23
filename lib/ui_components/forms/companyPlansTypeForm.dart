import 'package:flutter/material.dart';
import 'package:greylux_mobile/controls/crud_control/addBankAccount.dart';
import 'package:greylux_mobile/controls/crud_control/addCreditCard.dart';
import 'package:greylux_mobile/controls/crud_control/add_credit_card.dart';
import 'package:greylux_mobile/controls/crud_control/fundBankAccount.dart';
import 'package:greylux_mobile/controls/crud_control/fundWithCreditCard.dart';
import 'package:greylux_mobile/controls/crud_control/manualInvest.dart';
import 'package:greylux_mobile/controls/media.dart';
import 'package:greylux_mobile/styleSheet.dart';

class CompanyPlansTypeForm extends StatefulWidget {
  final int value;
  final formKey;

  const CompanyPlansTypeForm({
    Key key,
    this.formKey,
    this.value = 0,
  });

  @override
  _CompanyPlansTypeFormState createState() => _CompanyPlansTypeFormState();
}

class _CompanyPlansTypeFormState extends State<CompanyPlansTypeForm> {
  int selectedRadioTile;
  int selectedRadio;

  void initState() {
    super.initState();
    selectedRadio = 0;
    selectedRadioTile = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    dynamic deviceWidth;
    dynamic deviceHeight;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    final Map<String, dynamic> formData = {
      'cardNumber': null,
      'date': null,
      'cvv': null
    };
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('+ Set Investment',
                  textAlign: TextAlign.left, style: menuLabel()),
              ManualInvest(formData['cardNumber'], formData['date'],
                  formData['cvv'], formData, widget.formKey)
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: deviceHeight * 0.25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: white,
                      // border: Border.all(
                      //   color: Colors.red[500],
                      // ),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '000.00 (enter amount to invest)',
                            hintStyle: inputTextStyle()),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter card number';
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          formData['cardNumber'] = value;
                        },
                      ),
                    ],
                  ),
                ),
                // Divider(
                //   thickness: 2,
                //   indent: 00.0,
                //   endIndent: 00.0,
                // ),
                SizedBox(
                  height: 15,
                ),
                Container(
                    height: deviceHeight * 0.082,
                    width: deviceWidth * 1,
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: deviceWidth * 0.67,
                            child: dropDownText('Choose Plan')),
                        Icon(
                          Icons.arrow_drop_down,
                          color: darkgrey,
                          size: 34.0,
                          semanticLabel:
                              'Text to announce in accessibility modes',
                        ),
                      ],
                    )),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
