import 'package:flutter/material.dart';
import 'package:greylux_mobile/components/custom_surfix_icon.dart';
import 'package:greylux_mobile/components/default_button.dart';
import 'package:greylux_mobile/components/form_error.dart';
import 'package:greylux_mobile/components/no_account_text.dart';
import 'package:greylux_mobile/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../constants.dart';

// class Body extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Body();
//   }
// }

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String email;
  bool sent = false;
  final auth = FirebaseAuth.instance;
  passwordReset() async {
    try {
      _formKey.currentState.save();
      print('here');
      print(email);
      final user =
          await auth.sendPasswordResetEmail(email: email).then((value) {
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('Your Mail Was Sent!')));
        setState(() {
          sent = true;
        });
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: sent
          ? Center(
              child: SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20)),
                    child: Column(
                      children: [
                        //SizedBox(height: SizeConfig.screenHeight * 0.04),
                        Text(
                          "Email Sent",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(28),
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Your passsword reset mail has been sent, check your mail and follow the link to reset password.",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: [
                    SizedBox(height: SizeConfig.screenHeight * 0.04),
                    Text(
                      "Forgot Password",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(28),
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Please enter your email and we will send \nyou a link to return to your account",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.1),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (newValue) => email = newValue,
                            onChanged: (value) {
                              if (value.isNotEmpty &&
                                  errors.contains(kEmailNullError)) {
                                setState(() {
                                  errors.remove(kEmailNullError);
                                });
                              } else if (emailValidatorRegExp.hasMatch(value) &&
                                  errors.contains(kInvalidEmailError)) {
                                setState(() {
                                  errors.remove(kInvalidEmailError);
                                });
                              }
                              return null;
                            },
                            validator: (value) {
                              if (value.isEmpty &&
                                  !errors.contains(kEmailNullError)) {
                                setState(() {
                                  errors.add(kEmailNullError);
                                });
                              } else if (!emailValidatorRegExp
                                      .hasMatch(value) &&
                                  !errors.contains(kInvalidEmailError)) {
                                setState(() {
                                  errors.add(kInvalidEmailError);
                                });
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              //labelText: "Email",
                              hintText: "Enter your email",
                              hintStyle: TextStyle(
                                  fontSize: 12, fontFamily: 'ABeeZee'),
                              // If  you are using latest version of flutter then lable text and hint text shown like this
                              // if you r using flutter less then 1.20.* then maybe this is not working properly
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              suffixIcon: CustomSurffixIcon(
                                  svgIcon: "assets/icons/Mail.svg"),
                            ),
                          ),
                          SizedBox(height: getProportionateScreenHeight(30)),
                          FormError(errors: errors),
                          SizedBox(height: SizeConfig.screenHeight * 0.1),
                          DefaultButton(
                            text: "Send Mail",
                            press: () {
                              if (_formKey.currentState.validate()) {
                                Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text('Processing Data')));
                                passwordReset().then(() {});
                              }
                            },
                          ),
                          SizedBox(height: SizeConfig.screenHeight * 0.1),
                          NoAccountText(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
