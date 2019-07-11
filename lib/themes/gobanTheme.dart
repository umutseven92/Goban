import 'package:goban/themes/boardTheme.dart';
import 'package:goban/themes/stoneTheme.dart';

class GobanTheme {
  BoardTheme boardTheme;
  StoneThemes stoneThemes;

  GobanTheme.defaultTheme() {
    boardTheme = BoardTheme.defaultTheme();
    stoneThemes = StoneThemes.defaultTheme();
  }

  GobanTheme.bookTheme() {
    boardTheme = BoardTheme.bookTheme();
    stoneThemes = StoneThemes.bookTheme();
  }

  GobanTheme.jadeTheme() {
    boardTheme = BoardTheme.jadeTheme();
    stoneThemes = StoneThemes.jadeTheme();
  }

  GobanTheme({this.boardTheme, this.stoneThemes});
}
