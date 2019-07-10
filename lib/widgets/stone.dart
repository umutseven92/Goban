import 'package:flutter/material.dart';
import 'package:goban/themes/stoneTheme.dart';

class Stone extends StatelessWidget {
  final StoneTheme theme;
  final double size;

  const Stone({Key key, @required this.theme, @required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
