import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.answerData});

  final List<Map<String, Object>> answerData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: answerData.map((data) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 15.0,
              children: [
                CircleAvatar(
                  backgroundColor: data['right_answer'] == data['user_answer']
                      ? Colors.green
                      : Colors.red,
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        data['question_text'] as String,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Correct Answer: ${data['right_answer'] as String}',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Your Answer: ${data['user_answer'] as String}',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
