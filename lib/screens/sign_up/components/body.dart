import 'package:flutter/material.dart';
import 'package:greylux_mobile/components/socal_card.dart';
import 'package:greylux_mobile/constants.dart';
import 'package:greylux_mobile/size_config.dart';

import 'sign_up_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // 4%
                    Text("Register Account", style: headingStyle),
                    Text(
                      "Complete your details and register an account",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.08),
                    SignUpForm(),
                    SizedBox(height: SizeConfig.screenHeight * 0.02),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    Text('Terms and Conditions'),
                    SizedBox(height: SizeConfig.screenHeight * 0.01),
                    Text(
                      'By continuing your confirm that you agree \nwith our Term and Condition',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.caption,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
