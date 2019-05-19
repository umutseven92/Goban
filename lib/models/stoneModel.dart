import 'package:flutter/material.dart';
import 'package:goban/enums/player.dart';
import 'package:goban/themes/stoneTheme.dart';

class StoneModel with ChangeNotifier {
  bool _active = false;
  Player _player = Player.Black;
  final StoneThemes stoneThemes;
  final double size;

  StoneModel({@required this.stoneThemes, @required this.size});

  get active => _active;

  set active(bool active) {
    _active = active;
    notifyListeners();
  }

  get player => _player;

  set player(Player color) {
    _player = color;
    notifyListeners();
  }
}
