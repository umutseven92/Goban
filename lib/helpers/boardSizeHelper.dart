import 'package:goban/data_classes/position.dart';
import 'package:goban/enums/boardSize.dart';

class BoardSizeHelper {
  static int getBoardSizeFromEnum(BoardSize boardSize) {
    int size;
    switch (boardSize) {
      case BoardSize.Nine:
        size = 9;
        break;
      case BoardSize.Thirteen:
        size = 13;
        break;
      case BoardSize.Nineteen:
        size = 19;
        break;
    }

    return size;
  }

  static List<Position> getStartPointCoordinate(BoardSize boardSize) {
    List<Position> pos;

    switch (boardSize) {
      case BoardSize.Nine:
        pos = [
          Position(2, 2),
          Position(2, 6),
          Position(4, 4),
          Position(6, 2),
          Position(6, 6)
        ];
        break;
      case BoardSize.Thirteen:
        pos = [
          Position(3, 3),
          Position(3, 9),
          Position(6, 6),
          Position(9, 3),
          Position(9, 9)
        ];
        break;
      case BoardSize.Nineteen:
        pos = [
          Position(3, 3),
          Position(3, 15),
          Position(9, 9),
          Position(15, 3),
          Position(15, 15),
          Position(9, 3),
          Position(15, 3),
          Position(15, 3),
          Position(9, 15),
          Position(3, 9)
        ];
        break;
    }

    return pos;
  }
}
