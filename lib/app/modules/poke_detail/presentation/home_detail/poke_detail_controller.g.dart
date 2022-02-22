// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poke_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokeDetailController on ControllerBase, Store {
  final _$isFavoriteAtom = Atom(name: 'ControllerBase.isFavorite');

  @override
  bool get isFavorite {
    _$isFavoriteAtom.reportRead();
    return super.isFavorite;
  }

  @override
  set isFavorite(bool value) {
    _$isFavoriteAtom.reportWrite(value, super.isFavorite, () {
      super.isFavorite = value;
    });
  }

  final _$pokeDetailAtom = Atom(name: 'ControllerBase.pokeDetail');

  @override
  PokemonDetailModel get pokeDetail {
    _$pokeDetailAtom.reportRead();
    return super.pokeDetail;
  }

  @override
  set pokeDetail(PokemonDetailModel value) {
    _$pokeDetailAtom.reportWrite(value, super.pokeDetail, () {
      super.pokeDetail = value;
    });
  }

  final _$getPokeDetailAsyncAction =
      AsyncAction('ControllerBase.getPokeDetail');

  @override
  Future getPokeDetail({required String name}) {
    return _$getPokeDetailAsyncAction
        .run(() => super.getPokeDetail(name: name));
  }

  final _$ControllerBaseActionController =
      ActionController(name: 'ControllerBase');

  @override
  dynamic favoritePoke() {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.favoritePoke');
    try {
      return super.favoritePoke();
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFavorite: ${isFavorite},
pokeDetail: ${pokeDetail}
    ''';
  }
}
