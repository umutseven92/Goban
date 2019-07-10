import 'dart:async';

import 'package:goban/data_classes/move.dart';
import 'package:goban/data_classes/stonePosition.dart';
import 'package:goban/exceptions/gobanException.dart';
import 'package:goban/goban.dart';
import 'package:goban/models/gobanModel.dart';
import 'package:goban/themes/gobanTheme.dart';
import 'package:goban/themes/stoneTheme.dart';
import 'package:provider/provider.dart';

class GobanController {
  final int boardSize;
  final GobanTheme gobanTheme;
  final StoneThemes stoneThemes;
  final StreamController<StonePosition> gobanStream =
      StreamController<StonePosition>();

  ChangeNotifierProvider<GobanModel> goban;
  GobanModel _model;

  GobanController({this.boardSize = 13, this.gobanTheme, this.stoneThemes}) {
    if (boardSize < 2) {
      throw GobanException('Board size cannot be smaller than 2!');
    }

    _model = GobanModel(
        boardSize: boardSize,
        gobanTheme: gobanTheme ?? GobanTheme(),
        stoneThemes: stoneThemes ?? StoneThemes());

    _model.moveStream.stream.listen((StonePosition move) {
      gobanStream.add(move);
    });

    goban = ChangeNotifierProvider<GobanModel>(
        builder: (_) => _model, child: Goban());
  }

  void addMove(Move move) {
    _model.makeMove(move);
  }
}
