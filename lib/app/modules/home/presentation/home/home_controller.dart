import 'package:flutter/material.dart';
import 'package:ioasys_challenge/app/modules/home/service/repository/pokes_repository.dart';
import 'package:ioasys_challenge/shared/models/pokemon_model.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = ControllerBase with _$HomeController;

abstract class ControllerBase with Store {
  final fetchPokesData = PokesRepository();
  TextEditingController searchedPokeController = TextEditingController();

  @observable
  List<PokemonModel> allPokes = [];

  getPokes() async {
    allPokes = [];
    final pokes = await fetchPokesData();
    allPokes = pokes.asMap().entries.map<PokemonModel>((element) {
      int id = element.key + 1;
      String newId = id.toString();

      if (newId.length == 1) {
        newId = '00$newId';
      } else if (newId.length == 2) {
        newId = '0$newId';
      }

      element.value['id'] = newId;
      element.value['img'] =
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${element.key + 1}.png";
      return PokemonModel.fromJson(element.value);
    }).toList();
  }

  @action
  getSearchedPoke() async {
    if (searchedPokeController.text.isEmpty) {
      getPokes();
      return;
    }

    Map searchedPoke = await fetchPokesData.fetchSearchedPoke(
      name: searchedPokeController.text,
    );

    allPokes = [];

    if (searchedPoke.isEmpty) {
      PokemonModel fakePoke = PokemonModel(
        id: '',
        image: '',
        name: 'fake',
        type: '',
      );
      allPokes.add(fakePoke);
    } else {
      String newId = searchedPoke['id'].toString();

      if (newId.length == 1) {
        newId = '00$newId';
      } else if (newId.length == 2) {
        newId = '0$newId';
      }

      searchedPoke['name'] = searchedPokeController.text;
      searchedPoke['img'] =
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${searchedPoke['id']}.png";
      PokemonModel poke = PokemonModel(
        id: newId,
        name: searchedPoke['name'],
        image: searchedPoke['img'],
        type: searchedPoke['type'],
      );
      allPokes.add(poke);
    }
  }
}
