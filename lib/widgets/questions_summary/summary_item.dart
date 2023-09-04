import 'package:flutter/material.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final int questionIndex =
        int.tryParse(itemData['question_index'].toString()) ?? 0;
    final bool isCorrectAnswer = itemData['correct_answer'] as String ==
        (itemData['user_answer'] as String);

    return Row(
      children: [
        // QuestionIndentifier

        const SizedBox(width: 20),
        // Expended ทำให้ Column กินพื้นที่ให้เยอะสุดเท่าที่ทำได้ - ลองลบออกเพื่อเทียบความต่างดูได้นะ
        // (จากที่เรียนในคลาสว่า Column กินพื้นที่บนล่างจนสุด(Height) แต่ซ้ายขวา(width)จะกว้างเท่ากับขนาด child widget)
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Text(isCorrectAnswer.toString()),
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: !isCorrectAnswer ? Colors.red : Colors.green,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  (questionIndex + 1).toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                itemData['question'] as String,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'correct_answer : ' + (itemData['correct_answer'] as String),
                style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
              ),
              const SizedBox(
                height: 5,
              ),
              Text('user_answer : ' + (itemData['user_answer'] as String)),
              const SizedBox(
                height: 5,
              ),
              Text('Score : ' + (itemData['score'].toString())),
            ],
          ),
        )
      ],
    );
  }
}
