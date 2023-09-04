
class QuizQuestion {
  const QuizQuestion(this.text,this.answers, this.Score);

  final String text ;
  final List<String> answers ;
  final int Score ;

  List<String> get shuffledAnswers {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}