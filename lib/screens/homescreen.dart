import 'package:cgpa_calculator/provider/cgpa.dart';
import 'package:cgpa_calculator/provider/cgpabysem.dart';
import 'package:cgpa_calculator/screens/BySem.dart';
import 'package:cgpa_calculator/screens/normalcount.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          tabs: [
            new Tab(
              icon: Icon(Icons.book),
              text: "BY COURSE",
            ),
            new Tab(icon: new Icon(Icons.library_books), text: "BY SEMESTER"),
          ],
          controller: _tabController,
        ),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CGPA()),
          ChangeNotifierProvider(create: (_) => CGPAbysem()),
        ],
        child: TabBarView(
          controller: _tabController,
          children: [ByCourse(), BySem()],
        ),
      ),
    );
  }
}
