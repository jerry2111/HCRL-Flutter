import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/question.dart';
import 'package:flutter_application_1/widgets/answer_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;
  bool isLoading = false;

  void answerQuestion(String selectedAnswer) {
    // Show the progress indicator when an answer is selected.
    setState(() {
      isLoading = true;
    });

    // Simulate a delay for loading.
    Future.delayed(Duration(seconds: 1), () {
      widget.onSelectAnswer(selectedAnswer);
      setState(() {
        currentQuestionIndex = currentQuestionIndex + 1;
        isLoading = false; // Hide the progress indicator.
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = question[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              (currentQuestionIndex + 1).toString() +
                  "/" +
                  (question.length).toString(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            if (isLoading)
              const Padding(
                padding:
                    EdgeInsets.only(bottom: 30.0), // Adjust the value as needed
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            else
              ...currentQuestion.shuffledAnswers.map((answer) {
                return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    answerQuestion(answer);
                  },
                );
              }),
            const SizedBox(
              height: 50,
            ),
            if (!isLoading)
              LinearProgressIndicator(value: (currentQuestionIndex + 1) / 5),
          ],
        ),
      ),
    );
  }
}
