class QuestionModel {
  final String questionName;
  final List<String> answers;
  final String correctAnswer;

  QuestionModel({
    required this.questionName,
    required this.answers,
    required this.correctAnswer,
  });
}
