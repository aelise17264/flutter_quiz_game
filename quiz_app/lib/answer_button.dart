import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.finalAnswer,
  });

  final String answerText;
  final void Function() finalAnswer;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: finalAnswer,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: Text(answerText),
    );
  }
}
