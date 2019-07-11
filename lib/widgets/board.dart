import 'package:flutter/material.dart';
import 'package:goban/models/gobanModel.dart';
import 'package:provider/provider.dart';

class Board extends StatelessWidget {
  final double margin;
  const Board({Key key, @required this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var gobanModel = Provider.of<GobanModel>(context);

    return Container(
      margin: EdgeInsets.all(margin),
      color: gobanModel.gobanTheme.boardColor,
    );
  }
}
