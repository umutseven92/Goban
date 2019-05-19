import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  final Color lineColor;
  final double height;
  final double width;

  const Line({Key key, this.lineColor, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      color: lineColor,
      height: height,
    );
  }
}
