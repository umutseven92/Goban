library goban;

import 'package:flutter/material.dart';
import 'package:goban/data_classes/position.dart';
import 'package:goban/enums/player.dart';
import 'package:goban/gobanMap.dart';
import 'package:goban/helpers/boardSizeHelper.dart';
import 'package:goban/models/gobanModel.dart';
import 'package:goban/themes/stoneTheme.dart';
import 'package:goban/widgets/intersection.dart';
import 'package:goban/widgets/line.dart';
import 'package:goban/widgets/starPoint.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class Goban extends StatelessWidget {
  Widget _createIntersectionsFromGobanMap(
      GobanMap gobanMap, StoneThemes stoneThemes, double size) {
    var intersections = <Row>[];

    gobanMap.map.forEach((l) => intersections.add(Row(children: [
          for (Tuple2 item in l)
            Intersection(
              size: size,
              position: item.item1,
              stoneThemes: stoneThemes,
              player: item.item2,
              key: UniqueKey(),
            )
        ], mainAxisAlignment: MainAxisAlignment.spaceBetween)));

    var intersectionCol = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: intersections,
    );

    return intersectionCol;
  }

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

  Tuple2<List<Widget>, List<Widget>> _createLines(
      int boardSize, double width, Color color) {
    var verticalLines = _createVerticalLines(boardSize, width, color);
    var horizontalLines = _createHorizontalLines(boardSize, width, color);

    return Tuple2(verticalLines, horizontalLines);
  }

  List<Widget> _createVerticalLines(int boardSize, double width, Color color) {
    return [
      for (int i = 0; i < boardSize; i++)
        Line(
          lineColor: color,
          width: width,
        )
    ];
  }

  List<Widget> _createHorizontalLines(
      int boardSize, double height, Color color) {
    return [
      for (int i = 0; i < boardSize; i++)
        Line(
          lineColor: color,
          height: height,
        )
    ];
  }

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<GobanModel>(context);

    var gobanTheme = model.gobanTheme;
    var boardSize = BoardSizeHelper.getBoardSizeFromEnum(model.boardSize);

    var lines =
        _createLines(boardSize, gobanTheme.lineWidth, gobanTheme.lineColor);

    var verticalLines = lines.item1;
    var horizontalLines = lines.item2;
    var starPos = BoardSizeHelper.getStartPointCoordinate(model.boardSize);
    var starPoints = _createStarPoints(model.gobanMap, gobanTheme.lineColor,
        gobanTheme.lineWidth * 4, starPos);

    return Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: gobanTheme.lineColor, width: gobanTheme.lineWidth),
          color: gobanTheme.boardColor,
        ),
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) =>
                AspectRatio(
                  aspectRatio: 1.0,
                  child: Container(
                    child: Container(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(
                                constraints.maxWidth / (boardSize * 2)),
                            color: gobanTheme.boardColor,
                          ),
                          Positioned(
                            child: Container(
                              margin: EdgeInsets.all(
                                  constraints.maxWidth / (boardSize * 2)),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: verticalLines),
                            ),
                          ),
                          Positioned(
                            child: Container(
                              margin: EdgeInsets.all(
                                  constraints.maxWidth / (boardSize * 2)),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: horizontalLines),
                            ),
                          ),
                          Positioned(
                              child: Container(
                            margin: EdgeInsets.all(
                                constraints.maxWidth / (boardSize * 2.5)),
                            child: starPoints,
                          )),
                          Positioned(
                            child: Container(
                                child: _createIntersectionsFromGobanMap(
                                    model.gobanMap,
                                    model.stoneThemes,
                                    constraints.maxWidth / boardSize)),
                          ),
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
