import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/question.dart';
import 'package:flutter_application_1/screens/addquestions_screen.dart';
import 'package:flutter_application_1/screens/questions_screen.dart';
import 'package:flutter_application_1/screens/result_screen.dart';
import 'package:flutter_application_1/screens/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var _activeScreen = 'start-screen';
  List<String> _selectedAnswer = [];

  void _switchScreen() {
    setState(() {
      _activeScreen = 'questions-screen';
    });
  }

  void _addQuestionScreen() {
    setState(() {
      _activeScreen = 'addquestions-screen';
    });
  }

  void _chooseAnswer(String answer) {
    _selectedAnswer.add(answer);
    print(_selectedAnswer);

    if (_selectedAnswer.length == question.length) {
      setState(() {
        _activeScreen = 'result-screen' ;
      });
    }
  }

  void restartQuiz(){
    setState(() {
      _selectedAnswer.clear() ;
      _activeScreen = 'start-screen' ;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(_switchScreen,_addQuestionScreen);

    if(_activeScreen == 'questions-screen'){
      screenWidget = QuestionScreen(onSelectAnswer: _chooseAnswer,);
    }

    if(_activeScreen == 'result-screen'){
      screenWidget = ResultScreen(
        chooseAnswers: _selectedAnswer,
        onRestart: restartQuiz,
      );
    }

    // if(_activeScreen == 'addquestions-screen'){
    //   screenWidget = AddquestionsScreen(
    //     chooseAnswers: _selectedAnswer,
    //     onRestart: restartQuiz,
    //   );
    // }

    return MaterialApp(
      home: Scaffold(
        body: screenWidget,
        //body: QuestionScreen(),
      ),
    );
    ;
  }
}
