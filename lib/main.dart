import 'package:cgpa_calculator/screens/homescreen.dart';
import 'package:cgpa_calculator/screens/intro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './provider/cgpa.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  isNew() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.containsKey('isNew'));
    if (prefs.containsKey('isNew')) {
      return false;
    } else {
      prefs.setBool('isNew', false);
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CGPA Calculator',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureBuilder(
        future: isNew(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return !snapshot.data ? MyHomePage() : OnBoardingPage();
          }
          return Container();
        },
      ),
    );
  }
}
