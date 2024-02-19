import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizStateClass();
  }
}

class _QuizStateClass extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        selectedAnswers = [];
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (activeScreen == 'results-screen') {
      return ResultsScreen(chosenAnswers: selectedAnswers, onRestart: () {  },);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 26, 2, 40),
                Color.fromARGB(255, 45, 7, 54),
              ],
              begin: Alignment.topLeft, // Replace with your startAlignment
              end: Alignment.bottomRight, // Replace with your endAlignment
            ),
          ),
          child: activeScreen == 'start-screen' ? StartScreen(switchScreen): QuestionsScreen(onSelectAnswer: chooseAnswer),
        ),
      ),
    );
  }
}
