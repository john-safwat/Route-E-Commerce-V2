import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color darkBlue = Color(0xff06004F);
  static const Color blue = Color(0xff004182);
  static const Color white = Color(0xffFFFFFF);
  static const Color grey = Color(0xff4D4D4D);
  static const Color red = Color(0xFFBC3018);
  static const Color yellow = Colors.yellow;

  
  static Color nameToColor(String name) {
    const colors = {
      'red': Colors.red,
      'blue': Colors.blue,
      'green': Colors.green,
      'yellow': Colors.yellow,
      'orange': Colors.orange,
      'purple': Colors.purple,
      'pink': Colors.pink,
      'black': Colors.black,
      'white': Colors.white,
      'grey': Colors.grey,
      'gray': Colors.grey,
      'brown': Colors.brown,
      'cyan': Colors.cyan,
      'lime': Colors.lime,
      'indigo': Colors.indigo,
      'teal': Colors.teal,
      'amber': Colors.amber,
      'navy': Color(0xFF000080),
      'maroon': Color(0xFF800000),
      'olive': Color(0xFF808000),
      'silver': Color(0xFFC0C0C0),
    };

    return colors.entries
        .firstWhere(
          (entry) => entry.key.toLowerCase().contains(name.toLowerCase()),
          orElse: () => const MapEntry('unknown', Colors.grey),
        )
        .value;
  }

}
