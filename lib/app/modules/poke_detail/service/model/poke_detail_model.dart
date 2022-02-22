class PokemonDetailModel {
  int? height;
  List<String>? moves;
  List<Stats>? stats;
  List<Types>? types;
  String? flavorText;
  int? weight;

  PokemonDetailModel({
    this.height,
    this.moves,
    this.stats,
    this.types,
    this.flavorText,
    this.weight,
  });

  PokemonDetailModel.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    moves = json['moves'].cast<String>();
    if (json['stats'] != null) {
      stats = <Stats>[];
      json['stats'].forEach((v) {
        stats!.add(Stats.fromJson(v));
      });
    }
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add(Types.fromJson(v));
      });
    }
    flavorText = json['flavorText'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['height'] = height;
    data['moves'] = moves;
    if (stats != null) {
      data['stats'] = stats!.map((v) => v.toJson()).toList();
    }
    if (types != null) {
      data['types'] = types!.map((v) => v.toJson()).toList();
    }
    data['flavorText'] = flavorText;
    data['weight'] = weight;
    return data;
  }
}

class Stats {
  int? baseStat;
  Stat? stat;

  Stats({this.baseStat, this.stat});

  Stats.fromJson(Map<String, dynamic> json) {
    baseStat = json['base_stat'];
    stat = json['stat'] != null ? Stat.fromJson(json['stat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['base_stat'] = baseStat;
    if (stat != null) {
      data['stat'] = stat!.toJson();
    }
    return data;
  }
}

class Stat {
  String? name;

  Stat({this.name});

  Stat.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class Types {
  Stat? type;

  Types({this.type});

  Types.fromJson(Map<String, dynamic> json) {
    type = json['type'] != null ? Stat.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (type != null) {
      data['type'] = type!.toJson();
    }
    return data;
  }
}
