import 'package:flutter/material.dart';
import 'package:quiz_app/landing_screen.dart';
import 'package:quiz_app/questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? displayScreen;

  @override
  void initState() {
    displayScreen = LandingScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      displayScreen = QuestionsScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: const TextTheme(
          displayMedium: TextStyle(
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          displaySmall: TextStyle(
            fontSize: 18.0,
            color: Colors.deepPurpleAccent,
          ),
          bodyMedium: TextStyle(fontSize: 36.0, color: Colors.white),
        ),
      ),
      home: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: displayScreen,
      ),
    );
  }
}
