import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'nice try!';
    } else if (resultScore <= 12) {
      resultText = 'quite good !';
    } else if (resultScore <= 16) {
      resultText = 'my goodness!';
    } else {
      resultText = 'so badd!!!!!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhase,
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          ),
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.orange,
            ),
            onPressed: resetHandler,
            child: Text('Restart Quiz!'),
          ),
        ],
      ),
    );
  }
}
