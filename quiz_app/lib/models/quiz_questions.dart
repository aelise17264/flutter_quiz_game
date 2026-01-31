class QuizQuestions {
  const QuizQuestions(this.qText, this.qAnswers);

  final String qText;
  final List<String> qAnswers;

  List<String> getShuffelledAnswers() {
    final shuffledList = List.of(qAnswers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
