import 'package:flutter/material.dart';

class StoneThemes {
  StoneTheme blackStoneTheme;
  StoneTheme whiteStoneTheme;

  StoneThemes(this.blackStoneTheme, this.whiteStoneTheme);
}

class StoneTheme {
  static const Color defaultBlackStoneColor = Colors.black;
  static const Color defaultBlackStoneBorderColor = Colors.black;

  static const Color defaultWhiteStoneColor = Colors.white;
  static const Color defaultWhiteStoneBorderColor = Colors.black;

  Color borderColor;
  Color stoneColor;

  StoneTheme(this.borderColor, this.stoneColor);

  StoneTheme.defaultBlack() {
    this.stoneColor = defaultBlackStoneColor;
    this.borderColor = defaultBlackStoneBorderColor;
  }

  StoneTheme.defaultWhite() {
    this.stoneColor = defaultWhiteStoneColor;
    this.borderColor = defaultWhiteStoneBorderColor;
  }
}
