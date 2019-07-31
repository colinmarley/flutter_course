// First import all packages
import 'package:flutter/material.dart';

//Then import all project files
import './question.dart';
import './answer.dart';

void main() {
  // Entry Point of Application

  runApp(QuizApp());
}

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  var _questionIndex = 0;
  var _questionLimit = 1;

  void _chooseAnswer() {
    setState(() {
      if (_questionIndex < _questionLimit) {
        _questionIndex += 1;
      }
    });
    print('Answer Chosen');
    print(_questionIndex);
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
        body: Column(
          children: [
            Question(
              questions[_questionIndex],
            ),
            Answer(
              'Answer 1',
              _chooseAnswer,
            ),
            Answer(
              'Answer 2',
              _chooseAnswer,
            ),
            Answer(
              'Answer 3',
              _chooseAnswer,
            ),
          ],
        ),
      ),
    );
  }
}
