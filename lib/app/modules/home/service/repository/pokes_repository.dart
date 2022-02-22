import 'package:dio/dio.dart';

const urlBase = 'https://pokeapi.co/api/v2/pokemon';

class PokesRepository {
  final Dio _dio = Dio();

  Future<List> call() async {
    try {
      final response = await _dio.get('$urlBase/?limit=30');
      List pokes = response.data['results'];

      for (var i = 0; i < pokes.length; i++) {
        final responsePoke = await _dio.get(pokes[i]['url']);
        final type = responsePoke.data['types'][0]['type']['name'];
        pokes[i]['type'] = type;
      }

      return pokes;
    } catch (e) {
      throw 'Deu ruim';
    }
  }

  Future<Map> fetchSearchedPoke({required String name}) async {
    try {
      final response = await _dio.get('$urlBase/$name');
      final id = response.data['id'];
      final type = response.data['types'][0]['type']['name'];

      final Map poke = {
        'id': id,
        'type': type,
      };

      return poke;
    } catch (e) {
      final Map pokeError = {};
      return pokeError;
    }
  }
}
