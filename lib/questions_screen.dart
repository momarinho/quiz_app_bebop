import 'package:flutter/material.dart';
import '../answer_button.dart';
import '../data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int _currentQuestionIndex = 0;

  void _answerQuestion(String selectedAnswers) {
    widget.onSelectAnswer(selectedAnswers);
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questions.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[_currentQuestionIndex];

    return Container(
      padding: const EdgeInsets.all(40),
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            currentQuestion.text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              color: Color(0xFFB1B1B1),
              fontWeight: FontWeight.bold,
              fontFamily: 'FjallaOne',
              letterSpacing: 2,
              shadows: [
                Shadow(
                  color: Color(0xFF000000),
                  offset: Offset(1, 1),
                  blurRadius: 2,
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          ...currentQuestion.getShuffledOptions().map(
            (answer) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: AnswerButton(
                onTap: () {
                  _answerQuestion(answer);
                },
                answerText: answer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
