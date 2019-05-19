import 'package:flutter/material.dart';
import 'package:goban/enums/player.dart';
import 'package:goban/themes/stoneTheme.dart';

class StoneModel with ChangeNotifier {
  bool _active = false;
  Player _player = Player.Black;
  double _size;
  StoneThemes stoneThemes;

  StoneModel(this._size, {@required this.stoneThemes});

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

  get size => _size;

  set size(double val) {
    _size = val;
    notifyListeners();
  }
}
