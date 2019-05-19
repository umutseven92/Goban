import 'package:flutter/material.dart';

class StoneThemes {
  StoneTheme blackStoneTheme;
  StoneTheme whiteStoneTheme;

  StoneThemes({this.blackStoneTheme, this.whiteStoneTheme}) {
    if (blackStoneTheme == null) {
      blackStoneTheme = BlackStoneTheme.defaultBlack();
    }

    if (whiteStoneTheme == null) {
      whiteStoneTheme = WhiteStoneTheme.defaultWhite();
    }
  }
}

class WhiteStoneTheme implements StoneTheme {
  static const Color defaultWhiteStoneColor = Colors.white;
  static const Color defaultWhiteStoneBorderColor = Colors.black;

  WhiteStoneTheme({this.stoneColor, this.borderColor}) {
    if (stoneColor == null) {
      stoneColor = defaultWhiteStoneColor;
    }

    if (borderColor == null) {
      borderColor = defaultWhiteStoneBorderColor;
    }
  }

  WhiteStoneTheme.defaultWhite() {
    this.stoneColor = defaultWhiteStoneColor;
    this.borderColor = defaultWhiteStoneBorderColor;
  }

  @override
  Color borderColor;

  @override
  Color stoneColor;
}

class BlackStoneTheme implements StoneTheme {
  static const Color defaultBlackStoneColor = Colors.black;
  static const Color defaultBlackStoneBorderColor = Colors.black;

  BlackStoneTheme({this.stoneColor, this.borderColor}) {
    if (stoneColor == null) {
      stoneColor = defaultBlackStoneColor;
    }

    if (borderColor == null) {
      borderColor = defaultBlackStoneBorderColor;
    }
  }

  BlackStoneTheme.defaultBlack() {
    this.stoneColor = defaultBlackStoneColor;
    this.borderColor = defaultBlackStoneBorderColor;
  }

  @override
  Color borderColor;

  @override
  Color stoneColor;
}

abstract class StoneTheme {
  Color borderColor;
  Color stoneColor;
}
