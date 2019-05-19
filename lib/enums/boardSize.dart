enum BoardSize { Nine, Thirteen, NineTeen }

class BoardSizeHelper {
  static int getBoardSizeNumber(BoardSize boardSize) {
    int num;

    switch (boardSize) {
      case BoardSize.Nine:
        num = 9;
        break;
      case BoardSize.Thirteen:
        num = 13;
        break;
      case BoardSize.NineTeen:
        num = 19;
        break;
    }

    return num;
  }
}
