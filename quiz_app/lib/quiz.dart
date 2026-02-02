import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screens/landing_screen.dart';
import 'package:quiz_app/screens/questions_screen.dart';
import 'package:quiz_app/screens/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  Widget? displayScreen;

  @override
  void initState() {
    displayScreen = LandingScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      displayScreen = QuestionsScreen(onSelectAnswer: chooseAnswer);
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      displayScreen = LandingScreen(switchScreen);
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == qQuestions.length) {
      setState(() {
        displayScreen = ResultsScreen(
          userAnswers: selectedAnswers,
          onRestart: restartQuiz,
        );
      });
      // selectedAnswers = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: TextTheme(
          displayMedium: TextStyle(
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          displaySmall: TextStyle(
            fontSize: 18.0,
            color: Colors.deepPurpleAccent,
          ),
          bodyMedium: TextStyle(
            fontSize: 36.0,
            color: Colors.white,
            fontFamily: GoogleFonts.mavenPro().fontFamily,
          ),
          bodySmall: TextStyle(
            fontSize: 24.0,
            color: Colors.white,
            fontFamily: GoogleFonts.mavenPro().fontFamily,
          ),
          labelSmall: TextStyle(color: Colors.white),
        ),
      ),
      home: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: displayScreen,
      ),
    );
  }
}
