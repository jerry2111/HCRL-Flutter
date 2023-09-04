import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/question.dart';

import '../widgets/questions_summary/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    Key? key,
    required this.chooseAnswers,
    required this.onRestart,
  }) : super(key: key);

  final List<String> chooseAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chooseAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': question[i].text,
        'correct_answer': question[i].answers[0],
        'user_answer': chooseAnswers[i],
        'score': question[i].Score,
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestion = question.length;
    final numCorrectQuestion = summaryData
        .where(
          (data) => data['user_answer'] == data['correct_answer'],
        )
        .length;
    final correctQuestions = summaryData.where(
      (data) => data['user_answer'] == data['correct_answer'],
    );

    int sumScore = 0;
    int maxScore = 0;
    correctQuestions.forEach(
      (element) {
        sumScore += int.parse(element['score'].toString());
      },
    );
    summaryData.forEach(
      (element) {
        maxScore += int.parse(element['score'].toString());
      },
    );

    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'คุณตอบถูกทั้งหมด $numCorrectQuestion ข้อจาก $numTotalQuestion ข้อ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            QuestionSummary(summaryData),
            SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: onRestart,
              icon: Icon(Icons.refresh),
              label: Text('Restart Quiz'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Your Score : $sumScore/$maxScore',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            LinearProgressIndicator(
              value: (sumScore / maxScore),
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
