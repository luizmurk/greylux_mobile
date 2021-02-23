import 'package:flutter/material.dart';
import 'package:greylux_mobile/controls/crud_control/add_credit_card.dart';
import 'package:greylux_mobile/controls/media.dart';
import 'package:greylux_mobile/styleSheet.dart';

class DemoCardForm extends StatefulWidget {
  final int value;
  final formKey;

  const DemoCardForm({
    Key key,
    this.formKey,
    this.value = 0,
  });

  @override
  _DemoCardFormState createState() => _DemoCardFormState();
}

class _DemoCardFormState extends State<DemoCardForm> {
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
        children: [
          Container(
            height: deviceHeight * 0.35,
            padding: EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      // border: Border.all(
                      //   color: Colors.red[500],
                      // ),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '0000 0000 0000 000',
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: deviceWidth * 0.4,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            // border: Border.all(
                            //   color: Colors.red[500],
                            // ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'MM/YY',
                              hintStyle: inputTextStyle()),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter exp date';
                            }
                            return null;
                          },
                          onSaved: (String value) {
                            formData['date'] = value;
                          },
                        ),
                      ),
                      Container(
                        width: deviceWidth * 0.4,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            // border: Border.all(
                            //   color: Colors.red[500],
                            // ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'CVV',
                              hintStyle: inputTextStyle()),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter cards cvv';
                            }
                            return null;
                          },
                          onSaved: (String value) {
                            formData['cvv'] = value;
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          AddUser(formData['cardNumber'], formData['date'], formData['cvv'],
              formData, widget.formKey)
        ],
      ),
    );
  }
}
