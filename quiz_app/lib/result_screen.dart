import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswer,
    required this.restart,
  });

  final List<String> chosenAnswer;
  final void Function() restart;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": chosenAnswer[i],
      });
    }

    return summary;
  }

  @override
  Widget build(Object context) {
    final numTotalQuestion = questions.length;
    final numCorrectQuestion =
        summaryData
            .where((data) => data["user_answer"] == data["correct_answer"])
            .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$numCorrectQuestion out of $numTotalQuestion"),
            SizedBox(height: 30),
            QuestionSummary(summaryData: summaryData),
            TextButton(onPressed: restart, child: const Text("Restart Quiz")),
          ],
        ),
      ),
    );
  }
}
