// 1) Create a new Flutter App (in this project) and output an AppBar and some text
// below it
// 2) Add a button which changes the text (to any other text of your choice)
// 3) Split the app into three widgets: App, TextControl & Text
import 'package:flutter/material.dart';

void main() {
  runApp(AssignmentOne());
}

class AssignmentOne extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AssignmentOneState();
  }
}

class _AssignmentOneState extends State<AssignmentOne> {
  final _textOptions = const [
    'This is the First ever text',
    'This is the Second text',
  ];

  var _currentInd = 0;

  void changeText () {
    if(_currentInd == 0) {
      setState(() => {
        _currentInd = 1
      });
    } else {
      setState(() => {
        _currentInd = 0
      });
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AssignmentOne'),
        ),
        body: Column(
          children: <Widget>[
            Text(_textOptions[_currentInd]),
            FlatButton(
              child: Text('Change Text'),
              onPressed: () => {changeText()},
            )
          ],
        ),
      ),
    );
  }
}
