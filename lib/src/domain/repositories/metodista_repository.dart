import 'package:dio/dio.dart';
import 'package:metodistaapp/src/constants/string.dart';
import 'package:metodistaapp/src/infra/models/home_model.dart';
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
                tickets_text: json['bilhete_text'],
                boletim_text: json['boletim_text'],
                photos_boletim: json['fotos_boletim']
          ),
        ),
      );
      return movies;

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
