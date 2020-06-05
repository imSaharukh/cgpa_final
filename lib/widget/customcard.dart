import 'package:cgpa_calculator/provider/cgpa.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  CustomCard({@required this.course});

  final Course course;

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  TextEditingController nameController;
  TextEditingController cgpaController;
  TextEditingController crController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.course.name);
    cgpaController = TextEditingController(
        text: widget.course.gpa == null ? "" : widget.course.gpa.toString());
    crController = TextEditingController(
        text: widget.course.credit == null
            ? ""
            : widget.course.credit.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "COURSE NAME",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                onChanged: (value) {
                  widget.course.name = value;
                },
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextFormField(
                controller: cgpaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "GPA",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                onChanged: (value) {
                  //print(value);
                  widget.course.gpa = double.parse(value);
                },
                validator: (value) {
                  if (double.parse(value) > 4 || double.parse(value) < 0) {
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
                controller: crController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "CREDIT",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                onChanged: (value) {
                  widget.course.credit = double.parse(value);
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
