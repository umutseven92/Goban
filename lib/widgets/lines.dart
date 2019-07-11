import 'package:flutter/material.dart';
import 'package:goban/enums/boardSize.dart';
import 'package:goban/helpers/boardSizeHelper.dart';
import 'package:goban/widgets/line.dart';

class Lines extends StatelessWidget {
  final BoardSize boardSize;
  final double margin;
  final Color color;
  final double width;

  const Lines(
      {Key key,
      @required this.boardSize,
      @required this.margin,
      @required this.color,
      @required this.width})
      : super(key: key);

  List<Widget> _createVerticalLines() {
    return [
      for (int i = 0; i < BoardSizeHelper.getBoardSizeFromEnum(boardSize); i++)
        Line(
          lineColor: color,
          width: width,
        )
    ];
  }

  List<Widget> _createHorizontalLines() {
    return [
      for (int i = 0; i < BoardSizeHelper.getBoardSizeFromEnum(boardSize); i++)
        Line(
          lineColor: color,
          height: width,
        )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          child: Container(
            margin: EdgeInsets.all(margin),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _createVerticalLines()),
          ),
        ),
        Positioned(
          child: Container(
            margin: EdgeInsets.all(margin),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _createHorizontalLines()),
          ),
        )
      ],
    );
  }
}
