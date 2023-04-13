import 'package:flutter/material.dart';

class GameOver extends StatelessWidget {
  final _result;
  final _totalQuestions;
  final VoidCallback restartApp;
  GameOver(this._result, this._totalQuestions, this.restartApp);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Game Over\n" +
              _result.toString() +
              " / " +
              _totalQuestions.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        ElevatedButton(
          onPressed: restartApp,
          child: Text("Restart"),
        )
      ],
    );
  }
}
