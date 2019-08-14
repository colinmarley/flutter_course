// First import all packages
import 'package:flutter/material.dart';

//Then import all project files
import './quiz.dart';
import './result.dart';

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
  var _totalScore = 0;
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {
          'text': 'Black',
          'score': 10,
        },
        {
          'text': 'Red',
          'score': 5,
        },
        {
          'text': 'Green',
          'score': 3,
        },
        {
          'text': 'White',
          'score': 1,
        },
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {
          'text': 'Rabbit',
          'score': 1,
        },
        {
          'text': 'Snake',
          'score': 5,
        },
        {
          'text': 'Elephant',
          'score': 3,
        },
        {
          'text': 'Lion',
          'score': 10,
        },
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor',
      'answers': [
        {
          'text': 'Max',
          'score': 1,
        },
        {
          'text': 'Max',
          'score': 1,
        },
        {
          'text': 'Max',
          'score': 1,
        },
        {
          'text': 'Max',
          'score': 1,
        }
      ],
    }
  ];

  void _resetQuiz() {
    setState(() => {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {

    _totalScore += score;

    if (_questionIndex < _questions.length) {
      setState(() {
        _questionIndex += 1;
      });
    }
    print('Answer Chosen');
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: (_questionIndex < _questions.length)
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
