import 'package:flutter/material.dart';

enum Player { White, Black }

class StoneColorHelper {
  static Color getColorFromEnum(Player stone) {
    Color color;

    if (stone == Player.Black) {
      color = Colors.black;
    } else if (stone == Player.White) {
      color = Colors.white;
    }

    return color;
  }
}
