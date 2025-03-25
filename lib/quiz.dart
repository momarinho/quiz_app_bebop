import 'package:flutter/material.dart';
import '../start_screen.dart';
import 'questions_screen.dart';
import '../data/questions.dart';
import '../results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void restart() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget;
    if (activeScreen == 'start-screen') {
      screenWidget = StartScreen(switchScreen);
    } else if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    } else {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restart,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF203ba6), Color(0xFF161616), Color(0xFF020202)],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}