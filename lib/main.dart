import 'package:flutter/material.dart';
import 'package:quiz_app/answer.dart';
import 'package:quiz_app/game_over.dart';
import 'dart:developer';

import 'package:quiz_app/question.dart';
import 'package:restart_app/restart_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _result = 0;
  final questions = [
    {
      "questionText": "What is the largest planet in our solar system?",
      "answers": [
        {
          "answer": "Saturn",
          "correct": false,
        },
        {
          "answer": "Mars",
          "correct": false,
        },
        {
          "answer": "Jupiter",
          "correct": true,
        },
        {
          "answer": "Venus",
          "correct": false,
        },
      ]
    },
    {
      "questionText": "Which of the following is not a primary color?",
      "answers": [
        {
          "answer": "Green",
          "correct": true,
        },
        {
          "answer": "Red",
          "correct": false,
        },
        {
          "answer": "Blue",
          "correct": false,
        },
      ]
    },
    {
      "questionText": "What is the capital of Spain?",
      "answers": [
        {
          "answer": "Barcelona",
          "correct": false,
        },
        {
          "answer": "Madrid",
          "correct": true,
        },
      ]
    },
    {
      "questionText":
          "Which country gifted the Statue of Liberty to the United States?",
      "answers": [
        {
          "answer": "France",
          "correct": true,
        },
        {
          "answer": "United Kingdom",
          "correct": false,
        },
        {
          "answer": "Spain",
          "correct": false,
        },
      ]
    },
    {
      "questionText": "What is the tallest mountain in the world?",
      "answers": [
        {
          "answer": "Mount Everest",
          "correct": true,
        },
        {
          "answer": "K2",
          "correct": false,
        },
        {
          "answer": "Kilimanjaro",
          "correct": false,
        },
      ]
    },
    {
      "questionText": "What is the chemical symbol for gold?",
      "answers": [
        {
          "answer": "Au",
          "correct": true,
        },
        {
          "answer": "Ag",
          "correct": false,
        },
      ]
    },
    {
      "questionText": "Which US state is home to the Grand Canyon?",
      "answers": [
        {
          "answer": "Arizona",
          "correct": true,
        },
        {
          "answer": "California",
          "correct": false,
        },
        {
          "answer": "Colorado",
          "correct": false,
        },
      ]
    },
    {
      "questionText": "Which of the following is not a programming language?",
      "answers": [
        {
          "answer": "Java Beans",
          "correct": true,
        },
        {
          "answer": "Python",
          "correct": false,
        },
        {
          "answer": "Ruby",
          "correct": false,
        },
        {
          "answer": "C++",
          "correct": false,
        },
      ]
    },
    {
      "questionText": "What is the smallest country in the world?",
      "answers": [
        {
          "answer": "Monaco",
          "correct": false,
        },
        {
          "answer": "San Marino",
          "correct": false,
        },
        {
          "answer": "Vatican City",
          "correct": true,
        },
        {
          "answer": "Maldives",
          "correct": false,
        },
      ]
    },
    {
      "questionText": "Which element has the symbol Na?",
      "answers": [
        {
          "answer": "Nitrogen",
          "correct": false,
        },
        {
          "answer": "Sodium",
          "correct": true,
        },
      ]
    }
  ];

  restartApp() {
    log("RESTARTING... ");
    setState(() {
      _result = 0;
      _questionIndex = 0;
    });
  }

  void _answerQuestion(answer) {
    if (_questionIndex < questions.length) {
      if (answer["correct"]) {
        _result += 1;
      }
      setState(() {
        _questionIndex += 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: _questionIndex >= questions.length
            ? GameOver(_result, questions.length, restartApp)
            : Column(
                children: [
                  Question(
                    questions[_questionIndex]["questionText"] as String,
                  ),
                  ...(questions[_questionIndex]["answers"] as List<Object>)
                      .map((answer) => Answer(() => _answerQuestion(answer),
                          (answer as Map)["answer"]))
                      .toList(),
                ],
              ),
      ),
    );
  }
}
