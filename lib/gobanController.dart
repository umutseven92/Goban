import 'dart:async';

import 'package:goban/data_classes/move.dart';
import 'package:goban/data_classes/position.dart';
import 'package:goban/enums/boardSize.dart';
import 'package:goban/goban.dart';
import 'package:goban/models/gobanModel.dart';
import 'package:goban/themes/gobanTheme.dart';
import 'package:provider/provider.dart';

class GobanController {
  final BoardSize boardSize;
  final GobanTheme gobanTheme;
  final StreamController<Position> gobanStream =
      StreamController<Position>();

  ChangeNotifierProvider<GobanModel> goban;
  GobanModel _model;

  GobanController(
      {this.boardSize = BoardSize.Thirteen,
      this.gobanTheme}) {
    _model = GobanModel(
        boardSize: boardSize,
        gobanTheme: gobanTheme ?? GobanTheme.defaultTheme());

    _model.moveStream.stream.listen((Position move) {
      gobanStream.add(move);
    });

    goban = ChangeNotifierProvider<GobanModel>(
        builder: (_) => _model, child: Goban());
  }

  void addMove(Move move) {
    _model.makeMove(move);
  }
}
