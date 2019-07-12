
import 'package:flutter/material.dart';
import 'package:goban/data_classes/move.dart';
import 'package:goban/enums/player.dart';
import 'package:goban/gobanController.dart';
import 'package:goban/themes/gobanTheme.dart';
import 'package:goban/data_classes/position.dart';
import 'package:goban/enums/boardSize.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Goban Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Player player = Player.Black;
  String gobanTheme = 'default';
  BoardSize boardSize = BoardSize.Thirteen;

  GobanController gobanController;

  GobanTheme _getThemeFromString(String themeStr) {
    GobanTheme theme = GobanTheme.defaultTheme();

    if (themeStr == 'book') {
      theme = GobanTheme.bookTheme();
    } else if (themeStr == 'jade') {
      theme = GobanTheme.jadeTheme();
    }

    return theme;
  }

  @override
  void initState() {
    gobanController = GobanController(
        boardSize: boardSize, gobanTheme: _getThemeFromString(gobanTheme));

    gobanController.gobanStream.stream.listen((Position pos) {
      var clickedPlayer = gobanController.getPlayerFromPosition(pos);
      if (clickedPlayer == Player.Empty) {
        var move = Move(player, pos);

        gobanController.addMove(move);

        setState(() {
          player = player == Player.Black ? Player.White : Player.Black;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        gobanController.goban,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Theme:',
              style: TextStyle(fontSize: 16),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: DropdownButton<String>(
                value: gobanTheme,
                onChanged: (String theme) => setState(() {
                  gobanTheme = theme;
                  gobanController.setTheme(_getThemeFromString(gobanTheme));
                }),
                items: [
                  DropdownMenuItem(
                    child: Text('Default'),
                    value: 'default',
                  ),
                  DropdownMenuItem(
                    child: Text('Book'),
                    value: 'book',
                  ),
                  DropdownMenuItem(
                    child: Text('Jade'),
                    value: 'jade',
                  )
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Size:',
              style: TextStyle(fontSize: 16),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: DropdownButton<BoardSize>(
                value: boardSize,
                onChanged: (BoardSize size) => setState(() {
                  boardSize = size;
                  gobanController.setSize(boardSize);
                }),
                items: [
                  DropdownMenuItem(
                    child: Text('9x9'),
                    value: BoardSize.Nine,
                  ),
                  DropdownMenuItem(
                    child: Text('13x13'),
                    value: BoardSize.Thirteen,
                  ),
                  DropdownMenuItem(
                    child: Text('19x19'),
                    value: BoardSize.Nineteen,
                  )
                ],
              ),
            ),
          ],
        )
      ],
    ));
  }
}
