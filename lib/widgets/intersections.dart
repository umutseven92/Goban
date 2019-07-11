import 'package:flutter/material.dart';
import 'package:goban/gobanMap.dart';
import 'package:goban/models/gobanModel.dart';
import 'package:goban/themes/stoneTheme.dart';
import 'package:goban/widgets/intersection.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class Intersections extends StatelessWidget {
  final double size;

  const Intersections({Key key, @required this.size}) : super(key: key);

  Widget _createIntersectionsFromGobanMap(
      GobanMap gobanMap, StoneThemes stoneThemes) {
    var intersections = <Row>[];

    gobanMap.map.forEach((l) => intersections.add(Row(children: [
          for (Tuple2 item in l)
            Intersection(
              size: size,
              position: item.item1,
              stoneThemes: stoneThemes,
              player: item.item2,
              key: UniqueKey(),
            )
        ], mainAxisAlignment: MainAxisAlignment.spaceBetween)));

    var intersectionCol = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: intersections,
    );

    return intersectionCol;
  }

  @override
  Widget build(BuildContext context) {
    var gobanModel = Provider.of<GobanModel>(context);

    return _createIntersectionsFromGobanMap(
        gobanModel.gobanMap, gobanModel.stoneThemes);
  }
}
