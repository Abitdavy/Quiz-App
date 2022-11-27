import 'package:flutter/material.dart';

import './main.dart';
import './question.dart';
import './asnwer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int questionsIndex;

  Quiz(
      {required this.questions,
      required this.answerQuestion,
      required this.questionsIndex});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Questions(
        questions[questionsIndex]['questionText'] as String,
      ),
      ...(questions[questionsIndex]['answers'] as List<Map<String, Object>>)
          .map((answer) {
        return Answer(
            () => answerQuestion(answer['score']), answer['text'] as String);
      }).toList()
    ]);
  }
}
