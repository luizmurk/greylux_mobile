import 'package:flutter/material.dart';
import 'package:greylux_mobile/home.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

// void main() {
//   runApp(MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    new MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.light,
            accentColor: Colors.red,
            iconTheme: IconThemeData(color: Colors.red)),
        title: "Filipino Cuisine",
        home: MyHomePage(
          userId: 'My Home Page',
        ));
  }
}
