import 'package:flutter/material.dart';

class UIHelper {
  static final Map<String, Color> _typeColorMap = {
    'rock': const Color(0XFFB69E31),
    'ghost': const Color(0XFF70559B),
    'steel': const Color(0XFFB7B9D0),
    'water': const Color(0XFF6493EB),
    'grass': const Color(0XFF74CB48),
    'psychic': const Color(0XFFFB5584),
    'ice': const Color(0XFF9AD6DF),
    'dark': const Color(0XFF75574C),
    'fairy': const Color(0XFFE69EAC),
    'normal': const Color(0XFFAAA67F),
    'fighting': const Color(0XFFC12239),
    'flying': const Color(0XFFA891EC),
    'poison': const Color(0XFFA43E9E),
    'ground': const Color(0XFFDEC16B),
    'bug': const Color(0XFFA7B723),
    'fire': const Color(0XFFF57D31),
    'electric': const Color(0XFFF9CF30),
    'dragon': const Color(0XFF7037FF),
  };

  static Color getColorFromType(String type) {
    if (_typeColorMap.containsKey(type)) {
      return _typeColorMap[type] ?? Colors.pink.shade300;
    } else {
      return Colors.pink.shade300;
    }
  }
}
