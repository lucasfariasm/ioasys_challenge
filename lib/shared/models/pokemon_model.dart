class PokemonModel {
  String id;
  String name;
  String image;
  String type;

  PokemonModel({
    required this.id,
    required this.name,
    required this.image,
    required this.type,
  });

  factory PokemonModel.fromJson(Map json) {
    return PokemonModel(
      id: json['id'] ?? 1,
      name: json['name'] ?? '',
      image: json['img'] ?? '',
      type: json['type'] ?? '',
    );
  }

  Map toJson() {
    final data = {};

    data['id'] = id;
    data['name'] = name;
    data['img'] = image;
    data['type'] = type;

    return data;
  }
}
