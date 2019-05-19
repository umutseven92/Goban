import 'package:goban/enums/boardSize.dart';

class IntersectionHelper {
  static double calculateIntersectionAdjustmentFromBoardSize(
      BoardSize boardSize) {
    double adjustment;
    switch (boardSize) {
      case BoardSize.Nine:
        adjustment = -20;
        break;
      case BoardSize.Thirteen:
        adjustment = -10;
        break;
      case BoardSize.NineTeen:
        adjustment = -7.5;
        break;
    }

    return adjustment;
  }

  static double calculateBoardHeightAdjustmentFromBoardSize(
      BoardSize boardSize) {
    double adjustment;
    switch (boardSize) {
      case BoardSize.Nine:
        adjustment = 40;
        break;
      case BoardSize.Thirteen:
        adjustment = 20;
        break;
      case BoardSize.NineTeen:
        adjustment = 15;
        break;
    }

    return adjustment;
  }

  static double calculateBoardWidthAdjustmentFromBoardSize(
      BoardSize boardSize) {
    double adjustment;
    switch (boardSize) {
      case BoardSize.Nine:
        adjustment = 20;
        break;
      case BoardSize.Thirteen:
        adjustment = 0;
        break;
      case BoardSize.NineTeen:
        adjustment = -5;
        break;
    }

    return adjustment;
  }
}
