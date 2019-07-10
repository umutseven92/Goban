library goban;

import 'package:flutter/material.dart';
import 'package:goban/data_classes/stonePosition.dart';
import 'package:goban/enums/player.dart';
import 'package:goban/models/gobanModel.dart';
import 'package:goban/themes/stoneTheme.dart';
import 'package:goban/widgets/intersection.dart';
import 'package:goban/widgets/line.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class Goban extends StatelessWidget {
  Widget _getIntersections(List<List<Tuple2<StonePosition, Player>>> gobanMap,
      StoneThemes stoneThemes, double size) {
    var intersections = <Row>[];

    gobanMap.forEach((l) => intersections.add(Row(children: [
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

    var boardSize = model.boardSize;
    var gobanTheme = model.gobanTheme;

    var verticalLines = <Widget>[];
    var horizontalLines = <Widget>[];

    // Create lines
    for (int i = 0; i < boardSize; i++) {
      verticalLines.add(Line(
        lineColor: gobanTheme.lineColor,
        width: gobanTheme.lineWidth,
      ));

      horizontalLines.add(Line(
        lineColor: gobanTheme.lineColor,
        height: gobanTheme.lineWidth,
      ));
    }

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
                                child: _getIntersections(
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
