import 'package:ioasys_challenge/app/modules/poke_detail/service/model/poke_detail_model.dart';
import 'package:ioasys_challenge/app/modules/poke_detail/service/repository/poke_detail_repository.dart';
import 'package:mobx/mobx.dart';

part 'poke_detail_controller.g.dart';

class PokeDetailController = ControllerBase with _$PokeDetailController;

abstract class ControllerBase with Store {
  final fetchPokeDetailData = PokeDetailRepository();

  @observable
  bool isFavorite = false;

  @observable
  PokemonDetailModel pokeDetail = PokemonDetailModel();

  @action
  getPokeDetail({required String name}) async {
    final poke = await fetchPokeDetailData(name: name);
    pokeDetail = poke;
  }

  @action
  favoritePoke() {
    isFavorite = !isFavorite;
  }
}
