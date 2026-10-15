class Question {
  final String question;
  final List<String> options;
  final QuestionType type; // Added to identify question type

  const Question({
    required this.question,
    this.options = const [], // Optional for numeric questions
    required this.type,
  });
}

enum QuestionType {
  multipleChoice,
  numeric,
}
