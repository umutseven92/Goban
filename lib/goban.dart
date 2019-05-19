library goban;

import 'package:flutter/material.dart';
import 'package:goban/enums/boardSize.dart';
import 'package:goban/models/gobanModel.dart';
import 'package:goban/models/stoneModel.dart';
import 'package:goban/themes/gobanTheme.dart';
import 'package:goban/themes/stoneTheme.dart';
import 'package:goban/widgets/intersection.dart';
import 'package:goban/widgets/line.dart';
import 'package:provider/provider.dart';

class Goban extends StatelessWidget {
  final BoardSize boardSize;
  final GobanTheme gobanTheme;
  final StoneThemes stoneThemes;

  Goban({@required this.boardSize, this.gobanTheme, this.stoneThemes});

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

    var boardSizeNum = BoardSizeHelper.getBoardSizeNumber(boardSize);

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
    for (int i = 0; i < boardSizeNum; i++) {
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
        padding: EdgeInsets.all(10),
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) =>
                AspectRatio(
                  aspectRatio: 1.0,
                  child: Container(
                    child: Container(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            color: boardColor,
                          ),
                          Positioned(
                            child: Container(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: verticalLines),
                            ),
                          ),
                          Positioned(
                            child: Container(
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: horizontalLines),
                            ),
                          ),
                          Positioned(
                            /*
                top: IntersectionHelper
                    .calculateIntersectionAdjustmentFromBoardSize(boardSize),
                left: IntersectionHelper
                    .calculateIntersectionAdjustmentFromBoardSize(boardSize),
                child: Container(
                  height: MediaQuery.of(context).size.width +
                      IntersectionHelper
                          .calculateBoardHeightAdjustmentFromBoardSize(
                              boardSize),
                  width: MediaQuery.of(context).size.width +
                      IntersectionHelper
                          .calculateBoardWidthAdjustmentFromBoardSize(
                              boardSize),

                 */

                            child: Container(
                                child: _getIntersections(
                                    StoneModel(
                                        stoneThemes: stoneThemes,
                                        size: constraints.maxWidth /
                                            boardSizeNum),
                                    boardSizeNum)),
                          ),
                        ],
                      ),
                    ),
                  ),
                )));
  }

  Widget _getIntersections(StoneModel stoneModel, int boardSizeNum) {
    var intersections = <Row>[];

    for (int i = 0; i < boardSizeNum; i++) {
      var children = <Widget>[
        for (int j = 0; j < boardSizeNum; j++)
          ChangeNotifierProvider<StoneModel>(
              builder: (_) => stoneModel, child: Intersection())
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
