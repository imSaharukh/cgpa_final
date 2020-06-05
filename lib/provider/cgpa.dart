import 'package:flutter/cupertino.dart';

class CGPA with ChangeNotifier {
  Map<int, Details> details = new Map();

  add(int i) {
    details[i] = Details();
    notifyListeners();
  }
}

class Details {
  Details({this.credit, this.gpa, this.name});
  String name;
  double credit;
  double gpa;
}
