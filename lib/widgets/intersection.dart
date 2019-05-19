import 'package:flutter/material.dart';
import 'package:goban/enums/player.dart';
import 'package:goban/models/gobanModel.dart';
import 'package:goban/models/stoneModel.dart';
import 'package:goban/widgets/stone.dart';
import 'package:provider/provider.dart';

class Intersection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stoneModel = Provider.of<StoneModel>(context);

    Widget child;

    if (stoneModel.active) {
      var theme = stoneModel.player == Player.Black
          ? stoneModel.stoneThemes.blackStoneTheme
          : stoneModel.stoneThemes.whiteStoneTheme;
      child = Stone(
        key: UniqueKey(),
        theme: theme,
      );
    } else {
      child = Container(
        height: stoneModel.size,
        width: stoneModel.size,
        decoration: BoxDecoration(
            color: Color.fromARGB(120, 255, 0, 0),
            borderRadius: BorderRadius.circular(stoneModel.size)),
      );
    }

    return GestureDetector(onTap: () => _addStone(context), child: child);
  }

  void _addStone(BuildContext context) {
    final model = Provider.of<StoneModel>(context);
    if (model.active) {
      return;
    }

    final gobanModel = Provider.of<GobanModel>(context);

    model.active = true;
    model.player = gobanModel.turn;
    gobanModel.nextTurn();
  }
}
