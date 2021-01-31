import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Group Master',
      theme: new ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        accentColor: Colors.black,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Image.asset(
                  'images/menu.png',
                  color: Colors.orange,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          automaticallyImplyLeading: false,
          // centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(20.0),
                      child: new MaterialButton(
                        height: 100.0,
                        minWidth: 150.0,
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        child: new Text("Profile"),
                        onPressed: () => {},
                        splashColor: Colors.redAccent,
                      )),
                  Padding(
                      padding: EdgeInsets.all(20.0),
                      child: new MaterialButton(
                        height: 100.0,
                        minWidth: 150.0,
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        child: new Text("Menu"),
                        onPressed: () => {},
                        splashColor: Colors.redAccent,
                      )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ])),
      ),
    );
  }
}
