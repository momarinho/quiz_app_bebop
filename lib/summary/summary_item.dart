import 'package:flutter/material.dart';
import '../summary/questions_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(context) {
    final isCorrectAnswer =
        itemData['user-answer'] == itemData['correct-answer'];
    final color = isCorrectAnswer ? Colors.green : Colors.red;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionsIdentifier(
            isCorrectAnswer: isCorrectAnswer,
            questionIndex: itemData['question_index'] as int,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemData['question'] as String,
                  style: TextStyle(
                    color: color,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Your answer: ',
                        style: TextStyle(color: Colors.blue),
                      ),
                      TextSpan(
                        text: itemData['user-answer'] as String,
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                if (!isCorrectAnswer)
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Correct answer: ',
                          style: TextStyle(color: Colors.blue),
                        ),
                        TextSpan(
                          text: itemData['correct-answer'] as String,
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}