import 'package:goban/data_classes/position.dart';
import 'package:goban/enums/player.dart';

class Move {
  final Position position;
  final Player player;

  Move(this.player, this.position);
}
