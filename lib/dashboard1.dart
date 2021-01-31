import 'package:flutter/material.dart';
import 'package:feed_the_hungry/FoodDonar.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Dashboard extends StatefulWidget {
//  static const String routeName = '/login';

  Dashboard({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
//  ProgressDialog pr;
  String _state = "Locked";
  Color _lockTextColor = Colors.blueGrey;
//  List<User> _users;
  final _pwdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //listenForUsers();
  }

  @override
  void dispose() {
    super.dispose();
    _pwdController.dispose();
  }

  Card makeDashboardItem(
      String title, IconData icon, double maxwidth, double maxheight) {
    return Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 600,
            maxHeight: 600,
          ),
          padding: EdgeInsets.all(10),
          width: maxwidth / 2 - 10,
          height: maxwidth / 2 - 10,
          //color: Colors.pink,
          decoration: BoxDecoration(
            color: Colors.cyanAccent,
            borderRadius: new BorderRadius.circular(16.0),
          ),
          child: new InkWell(
            focusColor: Colors.cyanAccent,
            onTap: () {
              if (title == "Food") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Fooddetails()),
                );
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
                Center(
                    child: Icon(
                  icon,
                  size: 40.0,
                  color: Colors.black,
                )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title,
                      style:
                          new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }

  Widget returnbody(double maxwidth, double maxheight) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        width: maxwidth,
        height: maxheight,
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(3.0),
          children: <Widget>[
            makeDashboardItem("Food", Icons.food_bank, maxwidth, maxheight),
            makeDashboardItem("Blood", Icons.redeem, maxwidth, maxheight),
            makeDashboardItem("Books", Icons.book_online, maxwidth, maxheight),
            makeDashboardItem("Clothes", Icons.ac_unit, maxwidth, maxheight),
            makeDashboardItem("Charity", Icons.alarm, maxwidth, maxheight)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Sun Party',
        theme: new ThemeData(
          brightness: Brightness.light,
        ),
        home: LayoutBuilder(builder: (context, BoxConstraints constraints) {
          var maxwidth = constraints.maxWidth;
          var minwidth = constraints.minWidth;
          var maxheight = constraints.maxHeight;
          var minheight = constraints.minHeight;

          return ScreenTypeLayout.builder(
            mobile: (BuildContext context) => returnbody(maxwidth, maxheight),
          );
        }));
  }
}
