import 'package:dio/dio.dart';
import 'package:ioasys_challenge/app/modules/poke_detail/service/model/poke_detail_model.dart';

const urlBase = 'https://pokeapi.co/api/v2/pokemon';

class PokeDetailRepository {
  final Dio _dio = Dio();

  Future<PokemonDetailModel> call({required String name}) async {
    try {
      final responseDetail = await _dio.get('$urlBase/$name');
      final responseFlavorText = await _dio.get('$urlBase-species/$name');
      final types = responseDetail.data['types'];
      final weight = responseDetail.data['weight'];
      final height = responseDetail.data['height'];
      List<String> moves = [];
      final stats = responseDetail.data['stats'];
      final flavorText =
          responseFlavorText.data['flavor_text_entries'][9]['flavor_text'];
      moves.add(responseDetail.data['moves'][0]['move']['name']);
      moves.add(responseDetail.data['moves'][1]['move']['name']);

      Map<String, dynamic> json = {
        'height': height,
        'moves': moves,
        'stats': stats,
        'types': types,
        'flavorText': flavorText,
        'weight': weight,
      };

      return PokemonDetailModel.fromJson(json);
    } catch (e) {
      throw 'Deu ruim';
    }
  }
}
