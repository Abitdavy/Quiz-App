import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'what\'s your favourite color?',
      'answers': [
        {'text': 'black', 'score': 10},
        {'text': 'red', 'score': 5},
        {'text': 'green', 'score': 15},
        {'text': 'yellow', 'score': 12}
      ]
    },
    {
      'questionText': 'what\'s your favourite animal?',
      'answers': [
        {'text': 'rabiit', 'score': 10},
        {'text': 'godzilla', 'score': 20},
        {'text': 'joebiden', 'score': 18}
      ]
    },
    {
      'questionText': 'what\'s your favourite teacher?',
      'answers': [
        {'text': 'max', 'score': 10},
        {'text': 'mamax', 'score': 12},
        {'text': 'mhank gagak', 'score': 15}
      ]
    }
  ];

  var _questionsIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionsIndex = _questionsIndex + 1;
    });

    if (_questionsIndex < _questions.length) {
      print('we have more questions!');
    } else {
      print('questions done!');
    }

    print(_questionsIndex);
  }

  void _restartQuiz() {
    setState(() {
    _questionsIndex = 0;
    _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('my first app!!'),
        ),
        body: _questionsIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionsIndex: _questionsIndex,
                questions: _questions,
              )
            : Result(_totalScore,_restartQuiz),
      ),
    );
  }
}
