import 'package:flutter/material.dart';

class CGPA with ChangeNotifier {
  Map<int, Course> courses = new Map();

  var index = 0;
  double finalcgpa = 0;
  add() {
    courses[index] = Course();
    index++;
    notifyListeners();
  }

  remove(int listIndex) {
    courses.remove(courses.keys.toList()[listIndex]);
    notifyListeners();
  }

  String getKeyValue(int listIndex) =>
      courses.keys.toList()[listIndex].toString();

  Course getCourse(int listIndex) => courses.values.toList()[listIndex];
  calculateCGPA(Map<int, Course> courses) {
    double totalcr = 0;
    double totoal = 0;
    courses.forEach((key, value) {
      totalcr = totalcr + value.credit;
      totoal = totoal + (value.credit * value.gpa);
    });
    finalcgpa = totoal / totalcr;
    print("totoal $totoal");
    print("totoalcr $totalcr");

    notifyListeners();
  }
}

class Course {
  Course({this.credit, this.gpa, this.name});

  String name;
  double credit;
  double gpa;

  @override
  String toString() {
    return 'Course{name: $name, credit: $credit, gpa: $gpa}';
  }
}
