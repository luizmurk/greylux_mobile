import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:greylux_mobile/components/custom_surfix_icon.dart';
import 'package:greylux_mobile/components/form_error.dart';
import 'package:greylux_mobile/screens/forgot_password/forgot_password_screen.dart';
import 'package:greylux_mobile/screens/otp/otp_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  saveUserId(userID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userID', userID);
    prefs.setBool('logged', true);
    prefs.setBool('otpSecured', false);
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  Future<void> loginUser() async {
    print('loggin user');
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((result) {
        print(result.user.uid);
        saveUserId(result.user.uid);
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('Done Processing Data')));
        Navigator.pushNamed(context, OtpScreen.routeName);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Scaffold.of(context).showSnackBar(
            SnackBar(content: Text('No user found for that email.')));
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        Scaffold.of(context).showSnackBar(
            SnackBar(content: Text('Wrong password provided for that user.')));
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              // Checkbox(
              //   value: remember,
              //   activeColor: kPrimaryColor,
              //   onChanged: (value) {
              //     setState(() {
              //       remember = value;
              //     });
              //   },
              // ),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text("Forgot Password",
                    style: TextStyle(
                        fontSize: 17, fontFamily: 'Muli', color: Colors.grey)),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(22)),
          DefaultButton(
            text: "Log in",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                print(email);
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));
                loginUser();
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        //labelText: "Password",
        hintText: "Enter your password",
        hintStyle: TextStyle(fontSize: 12, fontFamily: 'ABeeZee'),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        //labelText: "Email",
        hintText: "Enter your email",
        hintStyle: TextStyle(fontSize: 12, fontFamily: 'ABeeZee'),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
