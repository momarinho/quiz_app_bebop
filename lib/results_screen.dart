import 'package:flutter/material.dart';
import '../data/questions.dart';
import '../summary/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct-answer': questions[i].options[0],
        'user-answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQuestions = questions.length;
    final numCorrectQuestions =
        summaryData.where((data) {
          return data['user-answer'] == data['correct-answer'];
        }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions questions of $totalQuestions correctly :D',
              style: TextStyle(fontSize: 18, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            QuestionsSummary(summaryData),
            SizedBox(height: 30),
            TextButton.icon(
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              icon: Icon(Icons.refresh),
              label: Text('Restart Quiz'),
              onPressed: () {
                onRestart();
              },
            ),
          ],
        ),
      ),
    );
  }
}
