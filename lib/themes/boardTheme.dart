import 'package:flutter/material.dart';

class BoardTheme {
  Color boardColor;
  Color lineColor;
  double lineWidth;

  static const Color defaultBoardColor = Colors.amber;
  static const Color defaultLineColor = Colors.black;
  static const double defaultLineWidth = 2.5;

  BoardTheme({this.boardColor, this.lineColor, this.lineWidth}) {
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

  BoardTheme.defaultTheme() {
    this.boardColor = defaultBoardColor;
    this.lineColor = defaultLineColor;
    this.lineWidth = defaultLineWidth;
  }

  BoardTheme.bookTheme() {
    this.boardColor = Colors.white;
    this.lineColor = Colors.black;
    this.lineWidth = 2.5;
  }

  BoardTheme.jadeTheme() {
    this.boardColor = Colors.amberAccent;
    this.lineColor = Colors.black;
    this.lineWidth = 2.5;
  }
}
