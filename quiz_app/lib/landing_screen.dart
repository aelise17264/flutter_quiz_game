import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 350,
              opacity: AlwaysStoppedAnimation(0.5),
            ),
            SizedBox(height: 20),
            Text(
              'Learn Flutter the fun way',
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: startQuiz,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              ),
              icon: const Icon(
                Icons.question_answer,
                size: 15.0,
                color: Colors.white,
              ),
              label: Text(
                "Start Quiz",
                style: Theme.of(context).textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
