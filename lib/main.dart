import 'package:cgpa_calculator/screens/intro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './provider/cgpa.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CGPA()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: OnBoardingPage(),
    );
  }
}
