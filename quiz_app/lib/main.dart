import 'package:flutter/material.dart';

void main() {
  // Entry Point of Application

  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {

  void chooseAnswer() {
    print('Answer Chosen');
  }

  @override
  Widget build(BuildContext ctx) {
    var questions = [
      'What\'s your favorite color?',
      'What\'s your favorite animal?',
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: Column(children: [
          Text('The question!'),
          RaisedButton(
            child: Text('Answer 1'),
            onPressed: () => chooseAnswer(),
          ),
          RaisedButton(
            child: Text('Answer 2'),
            onPressed: () => chooseAnswer(),
          ),
          RaisedButton(
            child: Text('Answer 3'),
            onPressed: () => chooseAnswer(),
          ),
        ],),
      ),
    );
  }
}
