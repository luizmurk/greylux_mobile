import 'package:flutter/material.dart';
import 'package:greylux_mobile/components/custom_surfix_icon.dart';
import 'package:greylux_mobile/components/default_button.dart';
import 'package:greylux_mobile/components/form_error.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:greylux_mobile/screens/otp/otp_screen.dart';
import 'package:greylux_mobile/data_management/databases.dart';
import 'package:intl/intl.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'registerUser.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String username;
  String conform_password;
  final Map<String, dynamic> formData = {
    'email': null,
    'username': null,
    'password': null
  };
  bool remember = false;

  final List<String> errors = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String eusername = 'username@gmail.com';
    String epassword = 'password';
    final smtpServer = gmail(eusername, epassword);
    // Use the SmtpServer class to configure an SMTP server:
    // final smtpServer = SmtpServer('smtp.domain.com');
    // See the named arguments of SmtpServer for further configuration
    // options.

    // Create our message.
    final message = Message()
      ..from = Address(eusername, 'Your name')
      ..recipients.add('destination@example.com')
      ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
      ..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = 'Test Dart Mailer library :: 😀 :: ${DateTime.now()}'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";
  }

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  saveUserId(userID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userID', userID);
    prefs.setBool('logged', true);
    prefs.setBool('otpSecured', false);
  }

  Future<void> registerUser() async {
    print('registering user');
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: formData['email'], password: formData['password'])
          // ignore: missing_return
          .then((result) {
        print(result.user.uid);
        users.add({
          'city': null,
          'email': formData['email'],
          'first_name': null,
          'last_name': null,
          'house_address': null,
          'phone_number': null,
          'state': null,
          'userID': result.user.uid,
          'username': formData['username']
        }).then((value) {
          userCredentials.add({
            'userID': result.user.uid,
            'username': formData['username'],
            'email': formData['email'],
            'availableBalance': 0.00,
            'investment_status': 'inactive',
            'hasMessage': 'yes',
            'credit_cards': {
              'card1': null,
              'card2': null,
              'card3': null,
            },
            'bitcoin_wallets': {
              'wallet_details1': null,
              'wallet_details2': null,
              'wallet_details3': null,
            },
            'bank_accounts': {
              'account1': null,
              'account2': null,
              'account3': null,
            },
          }).then((value) {
            var send = {
              'count': 0,
              'type': 'reply',
              'userID': result.user.uid,
              'time': "00:00",
              'date': DateFormat.yMMMMd('en_US')
                  .format(new DateTime.now())
                  .toString(),
              'text':
                  'Hi there, my name is chad. i am here to help ensure you have a seamless investment journey with lumyVest. Thank you'
            };

            messages.add(send).then((value) {
              saveUserId(result.user.uid);
              Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text('Done Processing Data')));
              Navigator.pushNamed(context, OtpScreen.routeName);
            }).catchError((error) {
              Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text('We encountered an error')));
            });
          }).catchError((error) {
            Scaffold.of(context).showSnackBar(
                SnackBar(content: Text('We encountered an error')));
          });
        }).catchError((error) {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('We encountered an error')));
        });
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('password is too weak')));
      } else if (e.code == 'email-already-in-use') {
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('User already exists')));
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
          buildUsernameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConformPassFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Register",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                print(formData);
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));
                registerUser();
                ;
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => conform_password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && password == conform_password) {
          removeError(error: kMatchPassError);
        }
        conform_password = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        //labelText: "Confirm Password",
        hintText: "Re-enter your password",
        hintStyle: TextStyle(fontSize: 12, fontFamily: 'ABeeZee'),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (String value) {
        formData['password'] = value;
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
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

  TextFormField buildUsernameFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (String value) {
        formData['username'] = value;
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kUsernameNullError);
        } else if (value.length < 9) {
          removeError(error: kUsernameTooLongError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kUsernameNullError);
          return "";
        } else if (value.length > 9) {
          addError(error: kUsernameTooLongError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        //labelText: "Email",
        hintText: "Enter your username",
        hintStyle: TextStyle(fontSize: 12, fontFamily: 'ABeeZee'),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (String value) {
        formData['email'] = value;
      },
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
        // labelText: "Email",
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
