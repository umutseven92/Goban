import 'package:flutter/material.dart';
import 'package:goban/models/stoneModel.dart';
import 'package:goban/themes/stoneTheme.dart';
import 'package:provider/provider.dart';

class Stone extends StatelessWidget {
  final StoneTheme theme;

  const Stone({Key key, @required this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stoneModel = Provider.of<StoneModel>(context);
    final size = stoneModel.size;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          border: Border.all(color: theme.borderColor, width: 2),
          color: theme.stoneColor,
          borderRadius: BorderRadius.circular(size)),
    );
  }
}
