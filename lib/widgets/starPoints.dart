import 'package:flutter/material.dart';
import 'package:goban/data_classes/position.dart';
import 'package:goban/enums/player.dart';
import 'package:goban/gobanMap.dart';
import 'package:goban/helpers/boardSizeHelper.dart';
import 'package:goban/models/gobanModel.dart';
import 'package:goban/widgets/starPoint.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class StarPoints extends StatelessWidget {
  const StarPoints({Key key}) : super(key: key);

  Widget _createStarPoints(
      GobanMap gobanMap, Color color, double size, List<Position> starPos) {
    var stars = <Row>[];
    gobanMap.map.forEach((l) => stars.add(Row(children: [
          for (Tuple2<Position, Player> item in l)
            if (starPos.any((sp) =>
                sp.column == item.item1.column && sp.row == item.item1.row))
              StarPoint(color: color, size: size, key: UniqueKey())
            else
              StarPoint(
                  color: Color.fromARGB(0, 255, 255, 255),
                  size: size,
                  key: UniqueKey())
        ], mainAxisAlignment: MainAxisAlignment.spaceBetween)));

    var starCol = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: stars,
    );

    return starCol;
  }

  @override
  Widget build(BuildContext context) {
    var gobanModel = Provider.of<GobanModel>(context);
    var starPos = BoardSizeHelper.getStartPointCoordinate(gobanModel.boardSize);

    return _createStarPoints(
        gobanModel.gobanMap,
        gobanModel.gobanTheme.boardTheme.lineColor,
        gobanModel.gobanTheme.boardTheme.lineWidth * 4,
        starPos);
  }
}
