import 'package:flutter/material.dart';
import 'package:feed_the_hungry/dashboard1.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue, backgroundColor: Colors.green[300]),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Wrap(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Spacer(),
            Column(children: <Widget>[
              Image(
                image: AssetImage('donar.jpg'),
                height: MediaQuery.of(context).size.width * 0.50,
                width: MediaQuery.of(context).size.width * 0.50,
              ),
              SizedBox(
                height: 10,
              ),
              FlatButton(
                  child: Text(
                    "Donar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  color: Colors.blue,
                  onPressed: () {})
            ]),
            Column(children: <Widget>[
              Image(
                image: AssetImage('donar.jpg'),
                height: MediaQuery.of(context).size.width * 0.50,
                width: MediaQuery.of(context).size.width * 0.50,
              ),
              SizedBox(
                height: 10,
              ),
              FlatButton(
                  child: Text(
                    "Receiver",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Dashboard(
                                title: 'DashBoard',
                              )),
                    );
                  })
            ]),
            //  Spacer(),
          ],
        ),
      ),
    );
  }
}
