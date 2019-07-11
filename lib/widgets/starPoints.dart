import 'package:flutter/material.dart';
import 'package:goban/data_classes/position.dart';
import 'package:goban/enums/player.dart';
import 'package:goban/gobanMap.dart';
import 'package:goban/widgets/starPoint.dart';
import 'package:tuple/tuple.dart';

class StarPoints extends StatelessWidget {
  final GobanMap gobanMap;
  final Color color;
  final double size;
  final List<Position> starPos;

  const StarPoints(
      {Key key,
      @required this.gobanMap,
      @required this.color,
      @required this.size,
      @required this.starPos})
      : super(key: key);

  Widget _createStarPoints() {
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
    return _createStarPoints();
  }
}
