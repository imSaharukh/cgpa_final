import 'package:cgpa_calculator/provider/cgpa.dart';
import 'package:cgpa_calculator/widget/customcard.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Consumer<CGPA>(builder: (context, cgpa, _) {
                return Column(
                  children: [
                    CircularPercentIndicator(
                      radius: 130.0,
                      animation: true,
                      animationDuration: 1200,
                      lineWidth: 15.0,
                      percent: (cgpa.finalcgpa * 0.25) > 1
                          ? 1
                          : (cgpa.finalcgpa * 0.25),
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          new Text(
                            "Total CGPA",
                            style: new TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12.0),
                          ),
                          Text(
                            cgpa.finalcgpa.toStringAsFixed(2),
                          )
                        ],
                      ),
                      circularStrokeCap: CircularStrokeCap.butt,
                      backgroundColor: Colors.yellow,
                      progressColor:
                          cgpa.finalcgpa > 3 ? Colors.green : Colors.red,
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(bottom: 65),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: cgpa.courses.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Dismissible(
                            key: Key(
                              cgpa.getKeyValue(index),
                            ),
                            onDismissed: (direction) {
                              cgpa.remove(index);
                              print(cgpa.courses.length);
                            },
                            child: CustomCard(
                              course: cgpa.getCourse(index),
                            ),
                          );
                        },
                      ),
                    )),
                  ],
                );
              }),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      Provider.of<CGPA>(context, listen: false).add();
                      // print(cgpa.details.length);
                      //  cgpa.details[indexs] = Details();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: OutlineButton(
          onPressed: () {
            print(_formKey.currentState.validate());
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
              var send = Provider.of<CGPA>(context, listen: false).courses;
              Provider.of<CGPA>(context, listen: false).calculateCGPA(send);
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text("calculate"),
          ),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}