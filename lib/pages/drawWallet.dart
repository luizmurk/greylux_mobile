import 'package:flutter/material.dart';
import 'package:greylux_mobile/styleSheet.dart';
import 'package:greylux_mobile/ui_components/allInvestments.dart';
import 'package:greylux_mobile/ui_components/availableBalance.dart';
import 'package:greylux_mobile/ui_components/form.dart';
import 'package:greylux_mobile/ui_components/header.dart';
import 'package:greylux_mobile/ui_components/headerBack.dart';
import 'package:greylux_mobile/ui_components/noInvestment.dart';
import 'package:greylux_mobile/ui_components/pullUpCard.dart';
import 'package:greylux_mobile/ui_components/loadDrawForms.dart';
import 'package:greylux_mobile/ui_components/savedCardsList.dart';

class DrawFundsPage extends StatefulWidget {
  DrawFundsPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _DrawFundsPageState createState() => _DrawFundsPageState();
}

class _DrawFundsPageState extends State<DrawFundsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //resizeToAvoidBottomPadding: false,
        //backgroundColor: scaffoldColor,
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [HeaderBack(), Expanded(child: LoadDrawForms())],
    ));
  }
}
