class Quiz {
  final int id;
  final String question;
  final String correctanswer;
  final List<String> answers;
  final List<String> whoanswer;
  final List<String> whonotanswer;

  bool selected = false;

  Quiz(this.id, this.question, this.correctanswer, this.answers, this.whoanswer, this.whonotanswer);
}