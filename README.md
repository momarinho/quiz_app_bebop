# Quiz App

This is a simple quiz application built with Flutter for learning. It presents the user with a series of questions, tracks their answers, and then displays a summary of their results at the end.

## Features

*   **Question Presentation:** Presents multiple-choice questions to the user.
*   **Answer Tracking:** Records the user's chosen answer for each question.
*   **Results Summary:** Displays a summary screen showing:
    *   The number of correct answers.
    *   A detailed breakdown of each question, including:
        *   Question number.
        *   The question text.
        *   The user's answer.
        *   The correct answer.
        *   A visual indicator (green/red circle) to denote if the answer was correct or incorrect.
* **Restart Quiz:** Allows the user to restart the quiz from the beginning.
* **Responsive**: It will adapt to the device width.
* **Scrollable**: The summary will be scrollable.

## Project Structure

The project is organized into the following key components:

*   **`main.dart`:** The entry point of the Flutter application.
*   **`quiz.dart`:** The main widget that manages the overall quiz state and navigation.
*   **`questions_screen.dart`:** The screen responsible for displaying the questions and handling user input.
*   **`results_screen.dart`:** The screen that displays the quiz results summary.
*   **`data/questions.dart`:** Contains the list of quiz questions and their corresponding answers.
*   **`quiz_questions.dart`:** A class that manages the quiz logic, including:
    *   Shuffling the questions.
    *   Tracking the current question.
    *   Recording user answers.
    *   Comparing user answers to correct answers.
    *   Generating the summary data.
* **`questions_summary.dart`:** A widget that displays the summary data in a list format. It uses the `SummaryItem` to display each question.
* **`questions_identifier.dart`**: A widget to display the questions number, and if it was correct or incorrect.
* **`summary_item.dart`**: A widget to display each item of the summary.
* **`answer_button.dart`**: A widget to display each answer button.

## Key Widgets

* **`QuestionsIdentifier`:** Displays a circular visual indicator next to each question number. The circle is green if the answer is correct and red if it's incorrect.
* **`SummaryItem`:** Represents a single item in the results summary. It contains the question, the user's answer, the correct answer, and a `QuestionsIdentifier`.
* **`QuestionsSummary`:** Displays the complete summary of the quiz, composed of multiple `SummaryItem` widgets.
* **`AnswerButton`**: A custom button for each answer.
