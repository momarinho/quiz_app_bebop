// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:quiz_app_bebop/main.dart';
import 'package:quiz_app_bebop/quiz.dart';

void main() {
  testWidgets('Quiz widget smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const Quiz());

    // Verify that a question is displayed.
    expect(find.textContaining('What is'), findsOneWidget);

    // Tap the first answer button and trigger a frame.
    await tester.tap(find.byType(AnswerButton).first);
    await tester.pump();

    // Verify that the question has changed.
    expect(find.textContaining('What is'), findsOneWidget);
  });
}