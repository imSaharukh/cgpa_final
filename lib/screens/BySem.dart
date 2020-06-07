import 'package:cgpa_calculator/provider/cgpa.dart';
import 'package:cgpa_calculator/provider/cgpabysem.dart';
import 'package:cgpa_calculator/widget/customcard.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class BySem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Consumer<CGPAbysem>(builder: (context, cgpa, _) {
        return Form(
          key: _formKey,
          child: Stack(
            children: [
              Column(
                children: [
                  CircularPercentIndicator(
                    radius: 130.0,
                    animation: true,
                    animationDuration: 1200,
                    lineWidth: 15.0,
                    percent: (cgpa.finalCGPAbysem * 0.25) > 1
                        ? 1
                        : (cgpa.finalCGPAbysem * 0.25),
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        new Text(
                          "Total CGPA",
                          style: new TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12.0),
                        ),
                        Text(
                          cgpa.finalCGPAbysem.toStringAsFixed(2),
                        )
                      ],
                    ),
                    circularStrokeCap: CircularStrokeCap.butt,
                    backgroundColor: Colors.yellow,
                    progressColor:
                        cgpa.finalCGPAbysem > 3 ? Colors.green : Colors.red,
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
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      //    print(_formKey.currentState.validate());
                      Provider.of<CGPAbysem>(context, listen: false).add();
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: OutlineButton(
                  onPressed: () {
                    print(_formKey.currentState.validate());
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      print(cgpa is CGPA);
                      var send = Provider.of<CGPAbysem>(context, listen: false)
                          .courses;

                      Provider.of<CGPAbysem>(context, listen: false)
                          .calculateCGPAbysem(send);
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
              )
            ],
          ),
        );
      }),
    );
  }
}
