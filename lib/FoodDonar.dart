import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:feed_the_hungry/image_picker_handler.dart';
// import 'package:feed_the_hungry/image_picker_dialog.dart';
import 'package:image_picker/image_picker.dart';

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
      home: Fooddetails(),
    );
  }
}

class Fooddetails extends StatefulWidget {
  @override
  _FooddetailsState createState() => _FooddetailsState();
}

class _FooddetailsState extends State<Fooddetails>
    with TickerProviderStateMixin {
  File _image;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 100);

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 100);

    setState(() {
      _image = image;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

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
          // appBar: AppBar(
          //   leading: Builder(
          //     builder: (BuildContext context) {
          //       return IconButton(
          //         icon: Image.asset(
          //           'images/menu.png',
          //           color: Colors.orange,
          //         ),
          //         onPressed: () {
          //           Scaffold.of(context).openDrawer();
          //         },
          //         tooltip:
          //             MaterialLocalizations.of(context).openAppDrawerTooltip,
          //       );
          //     },
          //   ),
          //   automaticallyImplyLeading: false,
          //   // centerTitle: true,
          // ),

          bottomNavigationBar: BottomAppBar(
              //    titleSpacing: 0.0,
              //elevation: 5.0,
              //  backgroundColor: Color(0xff201F23),
              // title:
              shape: CircularNotchedRectangle(),
              notchMargin: 6,
              //  color: Colors.blue,

              child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Row(children: <Widget>[
                    Spacer(),
                    SizedBox(
                      width: 10,
                    ),
                    RaisedButton(
                        padding: EdgeInsets.all(5),
                        onPressed: () async {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // Image.asset('Images/save.png', color: Colors.black),
                            SizedBox(width: 10.0),
                            Text(
                              "SHARE",
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                        ),
                        color: Colors.orange,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0))),
                    SizedBox(
                      width: 10,
                    ),
                    RaisedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //   Image.asset('Images/cancel.png', color: Colors.black),
                            SizedBox(width: 10.0),
                            Text(
                              "CANCEL",
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                        ),
                        color: Colors.orange,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)))
                  ]))),
          body: new Container(
            margin: EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Container(
                          constraints: BoxConstraints(
                              minHeight: 20,
                              minWidth: 300,
                              maxWidth: MediaQuery.of(context).size.width *
                                          0.65 <=
                                      300
                                  ? 300
                                  : MediaQuery.of(context).size.width * 0.65,
                              // maxWidth: MediaQuery.of(context).size.width,
                              maxHeight: double.infinity),
                          width: MediaQuery.of(context).size.width,
                          child:

                              ///merge onli
                              TextField(
                            decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
                                ),
                                border: InputBorder.none,
                                labelText: "Food Name",
                                labelStyle: TextStyle(fontSize: 20.0)),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          constraints: BoxConstraints(
                              minHeight: 20,
                              minWidth: 300,
                              maxWidth: MediaQuery.of(context).size.width *
                                          0.65 <=
                                      300
                                  ? 300
                                  : MediaQuery.of(context).size.width * 0.65,
                              //maxWidth: MediaQuery.of(context).size.width,
                              maxHeight: double.infinity),
                          width: MediaQuery.of(context).size.width,
                          child: TextField(
                            decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
                                ),
                                border: InputBorder.none,
                                labelText: "Food Quantity",
                                labelStyle: TextStyle(fontSize: 20.0)),
                            keyboardType: TextInputType.text,
                            // focusNode: idFocusNode,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          constraints: BoxConstraints(
                              minHeight: 20,
                              minWidth: 300,
                              maxWidth: MediaQuery.of(context).size.width *
                                          0.65 <=
                                      300
                                  ? 300
                                  : MediaQuery.of(context).size.width * 0.65,
                              //maxWidth: MediaQuery.of(context).size.width,
                              maxHeight: double.infinity),
                          width: MediaQuery.of(context).size.width,
                          child: TextField(
                            decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
                                ),
                                border: InputBorder.none,
                                labelText: "Contact Details",
                                labelStyle: TextStyle(fontSize: 20.0)),
                            keyboardType: TextInputType.text,
                            // focusNode: idFocusNode,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          constraints: BoxConstraints(
                              minHeight: 20,
                              minWidth: 300,
                              maxWidth: MediaQuery.of(context).size.width *
                                          0.65 <=
                                      300
                                  ? 300
                                  : MediaQuery.of(context).size.width * 0.65,
                              //maxWidth: MediaQuery.of(context).size.width,
                              maxHeight: double.infinity),
                          width: MediaQuery.of(context).size.width,
                          child: TextField(
                            decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
                                ),
                                border: InputBorder.none,
                                labelText: "Description",
                                labelStyle: TextStyle(fontSize: 20.0)),
                            keyboardType: TextInputType.text,
                            // focusNode: idFocusNode,
                          ),
                        ),
                      ],
                    ),
                    Row(children: [
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            _showPicker(context);
                          },
                          child: CircleAvatar(
                            radius: 100,
                            backgroundColor: Color(0xffFDCF09),
                            child: _image != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.file(
                                      _image,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    width: 100,
                                    height: 100,
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                          ),
                        ),
                      )
                    ]),
                    Row(
                      children: [
                        Container(
                          constraints: BoxConstraints(
                              minHeight: 20,
                              minWidth: 300,
                              maxWidth: MediaQuery.of(context).size.width *
                                          0.65 <=
                                      300
                                  ? 300
                                  : MediaQuery.of(context).size.width * 0.65,
                              //maxWidth: MediaQuery.of(context).size.width,
                              maxHeight: double.infinity),
                          width: MediaQuery.of(context).size.width,
                          child: TextField(
                            decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
                                ),
                                border: InputBorder.none,
                                labelText: "Address",
                                labelStyle: TextStyle(fontSize: 20.0)),
                            keyboardType: TextInputType.text,
                            // focusNode: idFocusNode,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ]),
            ),
          )),
    );
  }

  @override
  userImage(File _image) {
    setState(() {
      this._image = _image;
    });
  }
}
