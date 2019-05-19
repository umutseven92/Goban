import 'package:flutter/material.dart';

class GobanTheme {
  final Color boardColor;
  final Color lineColor;
  final double lineWidth;

  static const Color defaultBoardColor = Colors.amber;
  static const Color defaultLineColor = Colors.black;
  static const double defaultLineWidth = 3;

  GobanTheme({this.boardColor, this.lineColor, this.lineWidth});
}
