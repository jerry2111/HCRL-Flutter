import 'dart:html';

import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,this.addQuiz,{super.key});

  final void Function() startQuiz;
  final void Function() addQuiz;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            color: Color.fromARGB(255, 17, 198, 225),
            width: 300,
          ),
          const SizedBox(
            height: 80,
          ),
          const Text(
            'Welcome to morrow',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          OutlinedButton.icon(
            label: const Text("Start Quiz"),
            onPressed: startQuiz,
            icon: const Icon(Icons.arrow_right_alt),
          ),
          // OutlinedButton.icon(
          //   label: const Text("Addquestion Quiz"),
          //   onPressed: addQuiz,
          //   icon: const Icon(Icons.arrow_right_alt),
          // )
        ],
      ),
    );
  }
}
