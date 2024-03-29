import 'package:flutter/widgets.dart';
import 'package:greylux_mobile/screens/forgot_password/forgot_password_screen.dart';
import 'package:greylux_mobile/screens/otp/otp_screen.dart';
import 'package:greylux_mobile/screens/sign_in/sign_in_screen.dart';
import 'package:greylux_mobile/screens/splash/splash_screen.dart';

import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
};
