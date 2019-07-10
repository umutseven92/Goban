import 'dart:async';

import 'package:flutter/material.dart';
import 'package:goban/data_classes/move.dart';
import 'package:goban/data_classes/stonePosition.dart';
import 'package:goban/enums/player.dart';
import 'package:goban/themes/gobanTheme.dart';
import 'package:goban/themes/stoneTheme.dart';
import 'package:tuple/tuple.dart';

class GobanModel with ChangeNotifier {
  final int boardSize;
  final GobanTheme gobanTheme;
  final StoneThemes stoneThemes;

  final StreamController<StonePosition> moveStream =
      StreamController<StonePosition>();

  List<List<Tuple2<StonePosition, Player>>> gobanMap =
      List<List<Tuple2<StonePosition, Player>>>();

  GobanModel({this.boardSize, this.gobanTheme, this.stoneThemes}) {
    for (int i = 0; i < boardSize; i++) {
      var children = <Tuple2<StonePosition, Player>>[
        for (int j = 0; j < boardSize; j++)
          Tuple2(StonePosition(row: j, column: i), Player.Empty)
      ];

      gobanMap.add(children);
    }
  }

  void makeMove(Move move) {
    gobanMap[move.position.column][move.position.row] =
        gobanMap[move.position.column][move.position.row]
            .withItem2(move.player);

    notifyListeners();
  }

  @override
  void dispose() {
    moveStream.close();
    super.dispose();
  }
}
