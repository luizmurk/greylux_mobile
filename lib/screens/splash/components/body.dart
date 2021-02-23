import 'package:flutter/material.dart';
import 'package:greylux_mobile/constants.dart';
import 'package:greylux_mobile/screens/sign_in/sign_in_screen.dart';
import 'package:greylux_mobile/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

// This is the best practice
import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData;

  setUserFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('firstTime', false);
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> splashData = [
      {
        "text":
            "INVEST: Start your Investment journey today, with ease and a friendly interface.",
        "image": "assets/images/slide1.jpg"
      },
      {
        "text":
            "GROW FUNDS: Watch your funds grow as you wait for your investment due date.",
        "image": "assets/images/slide3.jpg"
      },
      {
        "text":
            "ON TIME PAYMENT: Get your return on investments on time and achieve your financial goals",
        "image": "assets/images/slide2.jpg"
      },
    ];
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: "Continue",
                      press: () {
                        setUserFirstTime();
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
