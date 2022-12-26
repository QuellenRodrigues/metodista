import 'package:dio/dio.dart';
import 'package:metodistaapp/src/constants/string.dart';
import 'package:metodistaapp/src/infra/models/home_model.dart';
import 'package:metodistaapp/src/infra/models/quiz_model.dart';
class MetodistaRepository{
  const MetodistaRepository(this.client);

  final Dio client;
  Future<List<HomeModel>> getData(String api) async {
    try {
      final url =
          '$baseUrl/$api';

      final response = await client.get(url);
      final movies = List<HomeModel>.of(
        response.data.map<HomeModel>(
              (json) => HomeModel(
                boletim_text: json['pastoral'],
                photos_boletim: json['fotosboletim'],
                birthday: json['aniversariantes'],
                tickets: json['bilhetes']
          ),
        ),
      );
      return movies;

    } catch (e) {
      throw e;
    }
  }

  Future<List<QuizModel>> getQuiz(String api) async {

    try {
      final url =
          '$baseUrl/$api';
      final response = await client.get(url);
      final quiz = List<QuizModel>.of(
        response.data.map<QuizModel>(
              (json) => QuizModel(
                  pergunta: json['pergunta'],
                  respostas: json['respostas'],
                  respostacerta: json['respostacerta'],
                  quemrespondeu: json['quemrespondeu'],
                  id: json['id'],
                  )
        ),
      );
      return quiz;

    } catch (e) {
      throw e;
    }
  }
  Future<List<QuizModel>>   getQuizFilter(String api, String id) async {

    try {
      final url =
          '$baseUrl/$api';
      final response = await client.get(url,options: Options(headers: {'id': id}));
      final quiz = List<QuizModel>.of(
        response.data.map<QuizModel>(
                (json) => QuizModel(
              pergunta: json['pergunta'],
              respostas: json['respostas'],
              respostacerta: json['respostacerta'],
              quemrespondeu: json['quemrespondeu'],
              id: json['id'],
            )
        ),
      );
      return quiz;

    } catch (e) {
      throw e;
    }
  }
  postData(String api, Object json) async{
    try{
      final url = '$baseUrl/$api';
      final response = await client.post(url,data: json);
      return response.data;
    }catch (e) {
      throw e;
    }
  }
}
