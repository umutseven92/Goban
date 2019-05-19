import 'package:goban/enums/boardSize.dart';

class StoneHelper {
  static double calculateStoneSizeFromBoardSize(BoardSize boardSize) {
    double stoneSize;
    switch (boardSize) {
      case BoardSize.Nine:
        stoneSize = 40;
        break;
      case BoardSize.Thirteen:
        stoneSize = 26;
        break;
      case BoardSize.NineTeen:
        stoneSize = 17.5;
        break;
    }

    return stoneSize;
  }
}
