import 'package:flutter/material.dart';
import 'package:greylux_mobile/styleSheet.dart';
import 'package:greylux_mobile/ui_components/headerBack.dart';
import 'package:greylux_mobile/ui_components/loadInvest.dart';

class InvestPage extends StatefulWidget {
  InvestPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _InvestPageState createState() => _InvestPageState();
}

class _InvestPageState extends State<InvestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //resizeToAvoidBottomPadding: false,
        //backgroundColor: scaffoldColor,
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [HeaderBack(), Expanded(child: LoadInvest())],
    ));
  }
}
