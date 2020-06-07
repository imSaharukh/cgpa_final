import 'package:flutter/material.dart';

class CGPAbysem with ChangeNotifier {
  Map<int, Coursebysem> courses = new Map();

  int index = 0;
  double finalCGPAbysem = 0;
  add() {
    courses[index] = Coursebysem();
    index++;
    notifyListeners();
  }

  remove(int listIndex) {
    courses.remove(courses.keys.toList()[listIndex]);
    notifyListeners();
  }

  String getKeyValue(int listIndex) =>
      courses.keys.toList()[listIndex].toString();

  Coursebysem getCourse(int listIndex) => courses.values.toList()[listIndex];
  calculateCGPAbysem(Map<int, Coursebysem> courses) {
    double totalcr = 0;
    double totoal = 0;
    courses.forEach((key, value) {
      totalcr = totalcr + value.credit;
      totoal = totoal + (value.credit * value.gpa);
    });
    finalCGPAbysem = totoal / totalcr;
    print("totoal $totoal");
    print("totoalcr $totalcr");
    print("final gpa $finalCGPAbysem");
    notifyListeners();
  }
}

class Coursebysem {
  Coursebysem({this.credit, this.gpa, this.name});

  String name;
  double credit;
  double gpa;

  @override
  String toString() {
    return 'Course{name: $name, credit: $credit, gpa: $gpa}';
  }
}
