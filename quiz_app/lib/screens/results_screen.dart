import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screens/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.userAnswers,
    required this.onRestart,
  });

  final List<String> userAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getAnswersSummary() {
    final List<Map<String, Object>> answerSummary = [];
    for (var i = 0; i < userAnswers.length; i++) {
      answerSummary.add({
        'question_index': i,
        'question_text': qQuestions[i].qText,
        'right_answer': qQuestions[i].qAnswers[0],
        'user_answer': userAnswers[i],
      });
    }

    return answerSummary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getAnswersSummary();
    final totalQuestions = qQuestions.length;
    final correctAnswers = summaryData.where((data) {
      return data['user_answer'] == data['right_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      // height: double.infinity,
      child: Container(
        margin: const EdgeInsets.only(left: 40, right: 40),
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctAnswers out of $totalQuestions questions correctly!',
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            QuestionsSummary(answerData: getAnswersSummary()),
            SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: onRestart,
              style: ElevatedButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                // padding: const EdgeInsets.symmetric(
                //   vertical: 10,
                //   horizontal: 40,
                // ),
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              icon: const Icon(
                Icons.restart_alt_sharp,
                color: Colors.white,
                size: 20.0
              ),
              label: Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
