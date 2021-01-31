import 'dart:io';

import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => new _AccountPageState();
}

int _currentStep;

class _AccountPageState extends State<AccountPage> {
  List<Step> steps = [
    Step(
      title: const Text('Enter your Phone Number'),
      isActive: true,
      state: StepState.complete,
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Phone Number'),
          ),
         
        ],
      ),
    ),
    Step(
      isActive: false,
      state: StepState.editing,
      title: const Text('Verification Code'),
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Code'),
          ), 
          ),
        ],
      ),
    ),
    Step(
      state: StepState.error,
      title: const Text('Profile'),
      subtitle: const Text("Error!"),
      content: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.red,
          )
             TextFormField(
            decoration: InputDecoration(labelText: 'Display Name'),
          ),

        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Create an account'),
        ),
        body: Column(children: <Widget>[
          Expanded(
            child: Stepper(
              onStepContinue: () {},
              steps: steps,
            ),
          ),
        ]));
  }
}
