import 'package:flutter/material.dart';

class QuestionsIdentifier extends StatelessWidget {
  const QuestionsIdentifier({
    super.key,
    required this.isCorrectAnswer,
    required this.questionIndex,
  });

  final int questionIndex;
  final bool isCorrectAnswer;

  @override
  Widget build(context) {
    final questionNumber = questionIndex + 1;
    return Center(
      widthFactor: 1.5,
      heightFactor: 1.5,
      child: Container(
        width: 30,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isCorrectAnswer ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          questionNumber.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
