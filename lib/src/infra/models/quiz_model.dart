class QuizModel {
  final String id;
  final String pergunta;
  final List respostas;
  final String respostacerta;
  final List quemrespondeu;


  QuizModel({
      required this.id,
      required this.pergunta,
      required this.respostas,
      required this.respostacerta,
      required this.quemrespondeu,

  });
}