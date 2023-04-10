import 'package:flutter/material.dart';
import 'dart:developer';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void answerQuestion() {
    setState(() {
      _questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      "What's your favourite color?",
      "What's your favourite animal?"
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questions[
                  _questionIndex <= questions.length - 1 ? _questionIndex : 0],
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: answerQuestion,
              child: Text("Answer 1"),
            ),
            ElevatedButton(
              onPressed: answerQuestion,
              child: Text("Answer 2"),
            ),
            ElevatedButton(
              onPressed: answerQuestion,
              child: Text("Answer 3"),
            ),
          ],
        ),
      ),
    );
  }
}
