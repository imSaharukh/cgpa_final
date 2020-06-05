import 'package:cgpa_calculator/widget/customcard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './provider/cgpa.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // final cgpa = Provider.of<CGPA>(context);
    int indexs;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Consumer<CGPA>(builder: (context, cgpa, _) {
                    return Form(
                      key: _formKey,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: cgpa.details.length,
                        itemBuilder: (BuildContext context, int index) {
                          indexs = index;

                          return Dismissible(
                            key: UniqueKey(),
                            onDismissed: (direction) {
                              cgpa.details.remove(index);
                              // cgpa.details[index] = Details();

                              print(cgpa.details.length);
                            },
                            child: CustomCard(
                                key: UniqueKey(),
                                index: index,
                                cgpa: cgpa,
                                namecontroller: new TextEditingController(),
                                cgpacontroller: new TextEditingController(),
                                crcontroller: new TextEditingController()),
                          );
                        },
                      ),
                    );
                  }),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    Provider.of<CGPA>(context, listen: false).add(indexs);
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
          // for (var item in cgpa.details) {
          //   print(item.credit);
          // }
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
    );
  }
}
