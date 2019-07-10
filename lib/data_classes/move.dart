import 'package:flutter/material.dart';
import 'package:goban/data_classes/stonePosition.dart';
import 'package:goban/enums/player.dart';

class Move {
  final StonePosition position;
  final Player player;

  Move({@required this.player, @required this.position});
}
