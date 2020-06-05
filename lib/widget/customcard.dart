import 'package:cgpa_calculator/provider/cgpa.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard(
      {this.index,
      this.cgpa,
      this.namecontroller,
      this.cgpacontroller,
      this.crcontroller,
      this.key});

  final int index;
  final CGPA cgpa;
  final TextEditingController namecontroller;
  final TextEditingController cgpacontroller;
  final TextEditingController crcontroller;
  final Key key;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: TextFormField(
                controller: namecontroller,
                decoration: InputDecoration(labelText: "COURSE NAME"),
                onChanged: (value) {
                  cgpa.details[index].name = value;
                },
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextFormField(
                controller: cgpacontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "GPA"),
                onChanged: (value) {
                  //print(value);
                  cgpa.details[index].gpa = double.parse(value);
                },
                validator: (value) {
                  if (double.parse(value) > 4 && double.parse(value) < 0) {
                    return 'can\'t more then 4';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextFormField(
                controller: crcontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "CREDIT"),
                onChanged: (value) {
                  cgpa.details[index].credit = double.parse(value);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'can\'t be empty';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
