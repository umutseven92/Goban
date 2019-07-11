import 'package:flutter/material.dart';

class StarPoint extends StatelessWidget {
  final Color color;
  final double size;

  const StarPoint({Key key, @required this.color, @required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(size)),
    );
  }
}
