import 'dart:async';

import 'package:flutter/material.dart';
import 'package:goban/data_classes/move.dart';
import 'package:goban/data_classes/stonePosition.dart';
import 'package:goban/themes/gobanTheme.dart';
import 'package:goban/themes/stoneTheme.dart';
import 'package:goban/gobanMap.dart';

class GobanModel with ChangeNotifier {
  final int boardSize;
  final GobanTheme gobanTheme;
  final StoneThemes stoneThemes;

  final StreamController<StonePosition> moveStream =
      StreamController<StonePosition>();
  
  GobanMap gobanMap;
  Move lastMove;

  GobanModel({this.boardSize, this.gobanTheme, this.stoneThemes}) {
    gobanMap = GobanMap(boardSize);
  }


  void makeMove(Move move) {
    lastMove = move;
    gobanMap.updateMap(move);
    notifyListeners();
  }

  @override
  void dispose() {
    moveStream.close();
    super.dispose();
  }
}
