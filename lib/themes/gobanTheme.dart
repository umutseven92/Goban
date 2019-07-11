import 'package:flutter/material.dart';

class GobanTheme {
  Color boardColor;
  Color lineColor;
  double lineWidth;

  static const Color defaultBoardColor = Colors.amber;
  static const Color defaultLineColor = Colors.black;
  static const double defaultLineWidth = 2.5;

  GobanTheme({this.boardColor, this.lineColor, this.lineWidth}) {
    if (boardColor == null) {
      boardColor = defaultBoardColor;
    }
    if (lineColor == null) {
      lineColor = defaultLineColor;
    }
    if (lineWidth == null) {
      lineWidth = defaultLineWidth;
    }
  }

  GobanTheme.defaultGoban() {
    this.boardColor = defaultBoardColor;
    this.lineColor = defaultLineColor;
    this.lineWidth = defaultLineWidth;
  }
}
