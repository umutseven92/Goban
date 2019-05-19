library goban;

import 'package:flutter/material.dart';
import 'package:goban/exceptions/gobanException.dart';
import 'package:goban/models/gobanModel.dart';
import 'package:goban/models/stoneModel.dart';
import 'package:goban/themes/gobanTheme.dart';
import 'package:goban/themes/stoneTheme.dart';
import 'package:goban/widgets/intersection.dart';
import 'package:goban/widgets/line.dart';
import 'package:provider/provider.dart';

class Goban extends StatelessWidget {
  final int boardSize;
  final GobanTheme gobanTheme;
  final StoneThemes stoneThemes;

  Goban({@required this.boardSize, this.gobanTheme, this.stoneThemes}) {
    if (boardSize < 2) {
      throw GobanException('Board size cannot be smaller than 2!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GobanModel>(
        builder: (_) => GobanModel(
            boardSize: boardSize,
            gobanTheme: gobanTheme == null ? GobanTheme() : gobanTheme,
            stoneThemes: stoneThemes == null ? StoneThemes() : stoneThemes),
        child: _Goban());
  }
}

class _Goban extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<GobanModel>(context);

    var boardSize = model.boardSize;
    var gobanTheme = model.gobanTheme;
    var stoneThemes = model.stoneThemes;

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
                                    boardSize,
                                    constraints.maxWidth / boardSize,
                                    stoneThemes)),
                          ),
                        ],
                      ),
                    ),
                  ),
                )));
  }

  Widget _getIntersections(
      int boardSizeNum, double size, StoneThemes stoneThemes) {
    var intersections = <Row>[];

    for (int i = 0; i < boardSizeNum; i++) {
      var children = <Widget>[
        for (int j = 0; j < boardSizeNum; j++)
          ChangeNotifierProvider<StoneModel>(
              builder: (_) => StoneModel(stoneThemes: stoneThemes, size: size),
              child: Intersection(
                key: UniqueKey(),
              ))
      ];

      intersections.add(Row(
          children: children,
          mainAxisAlignment: MainAxisAlignment.spaceBetween));
    }

    var intersectionCol = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: intersections,
    );

    return intersectionCol;
  }
}
