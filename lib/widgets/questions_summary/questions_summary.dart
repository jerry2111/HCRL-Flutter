import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/questions_summary/summary_item.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue, // Set the border color
                  width: 1.0, // Set the border width
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0), // Set border radius if desired
                ),
              ),
              margin: EdgeInsets.all(8.0), // Add margin between children
              padding: EdgeInsets.all(8.0), // Add padding inside each child
              child: SummaryItem(data),
            );
          }).toList(),
        ),
      ),
    );
  }
}
