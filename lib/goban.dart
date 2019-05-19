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
        builder: (_) =>
            GobanModel(boardSize: boardSize, gobanTheme: gobanTheme),
        child: _Goban());
  }
}

class _Goban extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<GobanModel>(context);

    var boardSize = model.boardSize;
    var theme = model.gobanTheme;

    var boardColor =
    theme == null ? GobanTheme.defaultBoardColor : theme.boardColor;
    var lineColor =
    theme == null ? GobanTheme.defaultLineColor : theme.lineColor;
    var lineWidth =
    theme == null ? GobanTheme.defaultLineWidth : theme.lineWidth;

    var stoneThemes = StoneThemes(
        model.stoneThemes?.blackStoneTheme == null
            ? StoneTheme.defaultBlack()
            : model.stoneThemes?.blackStoneTheme,
        model.stoneThemes?.whiteStoneTheme == null
            ? StoneTheme.defaultWhite()
            : model.stoneThemes?.whiteStoneTheme);

    var verticalLines = <Widget>[];
    var horizontalLines = <Widget>[];

    // Create lines
    for (int i = 0; i < boardSize; i++) {
      verticalLines.add(Line(
        lineColor: lineColor,
        width: lineWidth,
      ));

      horizontalLines.add(Line(
        lineColor: lineColor,
        height: lineWidth,
      ));
    }

    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: lineColor, width: lineWidth),
          color: boardColor,
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
                            margin: EdgeInsets.all(constraints.maxWidth /
                                (boardSize * 2)),
                            color: boardColor,
                          ),
                          Positioned(
                            child: Container(
                              margin: EdgeInsets.all(constraints.maxWidth /
                                  (boardSize * 2)),

                              child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: verticalLines),
                            ),
                          ),
                          Positioned(
                            child: Container(
                              margin: EdgeInsets.all(constraints.maxWidth /
                                  (boardSize * 2)),

                              child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: horizontalLines),
                            ),
                          ),
                          Positioned(
                            child: Container(
                                child: _getIntersections(
                                    boardSize, constraints.maxWidth /
                                    boardSize, stoneThemes)),
                          ),
                        ],
                      ),
                    ),
                  ),
                )));
  }

  Widget _getIntersections(int boardSizeNum, double size,
      StoneThemes stoneThemes) {
    var intersections = <Row>[];

    for (int i = 0; i < boardSizeNum; i++) {
      var children = <Widget>[
        for (int j = 0; j < boardSizeNum; j++)
          ChangeNotifierProvider<StoneModel>(
              builder: (_) =>
                  StoneModel(
                      stoneThemes: stoneThemes,
                      size: size), child: Intersection(key: UniqueKey(),))
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
