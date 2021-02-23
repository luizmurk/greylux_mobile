import 'package:flutter/material.dart';
import 'package:greylux_mobile/ui_components/form.dart';

class StandardCardPage extends StatefulWidget {
  StandardCardPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _StandardCardPageState createState() => _StandardCardPageState();
}

class _StandardCardPageState extends State<StandardCardPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Container(
        padding: EdgeInsets.all(10),
        child: DemoCardForm(
          formKey: formKey,
        ),
      )),
    );
  }
}
