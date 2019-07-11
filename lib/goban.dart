library goban;

import 'package:flutter/material.dart';
import 'package:goban/data_classes/position.dart';
import 'package:goban/enums/player.dart';
import 'package:goban/gobanMap.dart';
import 'package:goban/helpers/boardSizeHelper.dart';
import 'package:goban/models/gobanModel.dart';
import 'package:goban/themes/stoneTheme.dart';
import 'package:goban/widgets/intersection.dart';
import 'package:goban/widgets/lines.dart';
import 'package:goban/widgets/starPoints.dart';
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

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<GobanModel>(context);

    var gobanTheme = model.gobanTheme;
    var boardSize = BoardSizeHelper.getBoardSizeFromEnum(model.boardSize);

    var starPos = BoardSizeHelper.getStartPointCoordinate(model.boardSize);

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
                          Lines(
                              boardSize: model.boardSize,
                              color: gobanTheme.lineColor,
                              width: gobanTheme.lineWidth,
                              margin: constraints.maxWidth / (boardSize * 2)),
                          Positioned(
                              child: Container(
                            margin: EdgeInsets.all(
                                constraints.maxWidth / (boardSize * 2.5)),
                            child: StarPoints(
                                starPos: starPos,
                                gobanMap: model.gobanMap,
                                color: gobanTheme.lineColor,
                                size: gobanTheme.lineWidth * 4),
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
