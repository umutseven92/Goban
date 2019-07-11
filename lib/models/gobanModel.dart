import 'dart:async';

import 'package:flutter/material.dart';
import 'package:goban/data_classes/move.dart';
import 'package:goban/data_classes/position.dart';
import 'package:goban/enums/boardSize.dart';
import 'package:goban/themes/gobanTheme.dart';
import 'package:goban/gobanMap.dart';

class GobanModel with ChangeNotifier {
  final BoardSize boardSize;
  final GobanTheme gobanTheme;

  final StreamController<Position> moveStream =
      StreamController<Position>();
  
  GobanMap gobanMap;
  Move lastMove;

  GobanModel({this.boardSize, this.gobanTheme}) {
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
