import 'package:flutter/material.dart';
import 'package:goban/enums/player.dart';
import 'package:goban/themes/gobanTheme.dart';
import 'package:goban/themes/stoneTheme.dart';

class GobanModel with ChangeNotifier {
  final int boardSize;
  final double size;
  final GobanTheme gobanTheme;
  final StoneThemes stoneThemes;

  Player turn;

  GobanModel(
      {this.boardSize,
      this.size,
      this.gobanTheme,
      this.stoneThemes,
      this.turn = Player.Black});

  void nextTurn() {
    Player colorToSet;

    if (turn == Player.Black) {
      colorToSet = Player.White;
    } else if (turn == Player.White) {
      colorToSet = Player.Black;
    }

    turn = colorToSet;
    notifyListeners();
  }

  set boardSize(int boardSize) {
    this.boardSize = boardSize;
    notifyListeners();
  }
}
