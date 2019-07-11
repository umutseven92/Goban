import 'package:goban/data_classes/move.dart';
import 'package:goban/data_classes/position.dart';
import 'package:goban/enums/boardSize.dart';
import 'package:goban/helpers/boardSizeHelper.dart';
import 'package:tuple/tuple.dart';
import 'package:goban/enums/player.dart';

class GobanMap {
  final BoardSize boardSize;

  final List<List<Tuple2<Position, Player>>> map =
      List<List<Tuple2<Position, Player>>>();


  GobanMap(this.boardSize) {
    _initMap();
  }

  void _initMap() {
    var boardSizeNum = BoardSizeHelper.getBoardSizeFromEnum(boardSize);

    for (int i = 0; i < boardSizeNum; i++) {
      var children = <Tuple2<Position, Player>>[
        for (int j = 0; j < boardSizeNum; j++)
          Tuple2(Position(j, i), Player.Empty)
      ];

      map.add(children);
    }
  }

  void updateMap(Move move) {
    map[move.position.column][move.position.row] =
        map[move.position.column][move.position.row]
            .withItem2(move.player);
  }
}
