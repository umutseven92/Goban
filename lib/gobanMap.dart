import 'package:goban/data_classes/move.dart';
import 'package:tuple/tuple.dart';
import 'package:goban/data_classes/stonePosition.dart';
import 'package:goban/enums/player.dart';

class GobanMap {
  final int boardSize;

  final List<List<Tuple2<StonePosition, Player>>> map =
      List<List<Tuple2<StonePosition, Player>>>();


  GobanMap(this.boardSize) {
    _initMap();
  }

  void _initMap() {
    for (int i = 0; i < boardSize; i++) {
      var children = <Tuple2<StonePosition, Player>>[
        for (int j = 0; j < boardSize; j++)
          Tuple2(StonePosition(j, i), Player.Empty)
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
