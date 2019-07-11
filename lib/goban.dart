import 'package:flutter/material.dart';
import 'package:goban/helpers/boardSizeHelper.dart';
import 'package:goban/models/gobanModel.dart';
import 'package:goban/widgets/board.dart';
import 'package:goban/widgets/intersections.dart';
import 'package:goban/widgets/lines.dart';
import 'package:goban/widgets/starPoints.dart';
import 'package:provider/provider.dart';

class Goban extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<GobanModel>(context);

    var gobanTheme = model.gobanTheme;
    var boardSize = BoardSizeHelper.getBoardSizeFromEnum(model.boardSize);

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
                          Board(margin: constraints.maxWidth / (boardSize * 2),),
                          Lines(margin: constraints.maxWidth / (boardSize * 2)),
                          Positioned(
                              child: Container(
                            margin: EdgeInsets.all(
                                constraints.maxWidth / (boardSize * 2.5)),
                            child: StarPoints(),
                          )),
                          Positioned(
                            child: Container(
                                child: Intersections(
                                    size: constraints.maxWidth / boardSize)),
                          ),
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
