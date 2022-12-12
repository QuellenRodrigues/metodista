import 'package:dio/dio.dart';
import 'package:metodistaapp/src/infra/models/home_model.dart';
class MetodistaRepository{
  const MetodistaRepository(this.client);

  final Dio client;
  Future<List<HomeModel>> getData(String api) async {
    try {
      final url =
          'https://us-central1-metodista-842fa.cloudfunctions.net/$api';

      final response = await client.get(url);

      final movies = List<HomeModel>.of(
        response.data.map<HomeModel>(
              (json) => HomeModel(
                tickets_text: json['texto'],
          ),
        ),
      );

      return movies;
    } catch (e) {
      throw e;
    }
  }
}