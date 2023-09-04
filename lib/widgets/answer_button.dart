import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.answerText,required this.onTap});

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: ElevatedButton(
        
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueGrey,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        ),
        child: Text(answerText),
      ),
    );
  }
}
