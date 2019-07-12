import 'dart:async';

import 'package:flutter/material.dart';
import 'package:goban/data_classes/move.dart';
import 'package:goban/data_classes/position.dart';
import 'package:goban/enums/boardSize.dart';
import 'package:goban/enums/player.dart';
import 'package:goban/themes/gobanTheme.dart';
import 'package:goban/gobanMap.dart';

class GobanModel with ChangeNotifier {
  BoardSize boardSize;
  GobanTheme gobanTheme;

  final StreamController<Position> moveStream = StreamController<Position>();

  final List<Move> _moves = List<Move>();
  Move get lastMove => _moves.isEmpty ? null: _moves.last;

  GobanMap gobanMap;

  GobanModel({this.boardSize, this.gobanTheme}) {
    gobanMap = GobanMap(boardSize);
  }

  void makeMove(Move move) {
    _moves.add(move);
    gobanMap.updateMap(move);
    notifyListeners();
  }

  @override
  void dispose() {
    moveStream.close();
    super.dispose();
  }

  Player getPlayerFromPosition(Position pos) {
    return gobanMap.getPlayerFromMap(pos);
  }

  void setTheme(GobanTheme theme) {
    gobanTheme = theme;
    notifyListeners();
  }

  void setSize(BoardSize size) {
    boardSize = size;
    gobanMap = GobanMap(size);
    notifyListeners();
  }
}
