import 'package:flutter/material.dart';

import 'package:ioasys_challenge/shared/models/pokemon_model.dart';

import 'pokemon_card.dart';

class PokemonGrid extends StatefulWidget {
  final List<PokemonModel> pokemon;
  const PokemonGrid({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  _PokemonGridState createState() => _PokemonGridState();
}

class _PokemonGridState extends State<PokemonGrid> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 50),
      sliver: SliverGrid.count(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: widget.pokemon
            .map(
              (pokemon) => PokemonCard(
                id: pokemon.id,
                name: pokemon.name,
                image: pokemon.image,
                type: pokemon.type,
              ),
            )
            .toList(),
      ),
    );
  }
}
