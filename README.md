# Goban

![Goban](https://res.cloudinary.com/dk4dtpymd/image/upload/c_scale,w_300/v1562940409/hwpmktcbazqa2qbwaale.gif "Goban")

Customizable Go board widget for Flutter.

## Usage

Initialize a `GobanController` like so:

```dart
gobanController = GobanController(boardSize: BoardSize.Thirteen);
```

Then subscribe to the move stream:

```dart
gobanController.gobanStream.stream.listen((Position position) {
    // A move at 'position' was played
    // Decide what to do here
});
```

Whenever an intersection is clicked, the above method will fire.

**Goban does not have any game logic**; this is by design. Goban make no assumptions on what you want to do, so that it can be used for all purposes. Maybe you want to use it for Tsumego purposes, or maybe you want to use it for online multiplayer. Both of these required different logic, therefore Goban delegates all game logic responsibilities to the client.

For example, a simple local board would be:

```dart
player = Player.Black;

gobanController.gobanStream.stream.listen((Position position) {
    // A move at 'position; has been made.
    var clickedPlayer = gobanController.getPlayerFromPosition(pos); // Get the intersection at 'position'
    if (clickedPlayer == Player.Empty) { // If the intersection is empty;
        var move = Move(player, pos); // Create move

        gobanController.addMove(move); // Make the move on the goban.

        setState(() {
            player = player == Player.Black ? Player.White : Player.Black; // Other players' turn
        });
    }
});
```

Please see [here](https://github.com/umutseven92/Goban/blob/master/lib/example/localBoard.dart) for a more concrete example.

## Customization Options

The board and the stones are fully customizable:

```dart
gobanController = GobanController(
    boardSize: BoardSize.Nine,
    gobanTheme: GobanTheme(
        stoneThemes: StoneThemes(
            blackStoneTheme: BlackStoneTheme(
                stoneColor: Colors.black45, borderColor: Colors.black),
            whiteStoneTheme: WhiteStoneTheme(
                borderColor: Colors.white, stoneColor: Colors.tealAccent)),
        boardTheme: BoardTheme(
            boardColor: Colors.yellow,
            lineColor: Colors.red,
            lineWidth: 3)));
```

Aside from the default theme, there are also two preset themes available:

### Book Theme

![Book Theme](https://res.cloudinary.com/dk4dtpymd/image/upload/c_scale,w_300/v1562940367/vt21rzfcrn2cj5mn6lzq.jpg "Book Theme")

```dart
gobanController = GobanController(
    boardSize: boardSize, gobanTheme: GobanTheme.bookTheme());
```

### Jade Theme

![Jade Theme](https://res.cloudinary.com/dk4dtpymd/image/upload/c_scale,w_300/v1562940367/gybzp2kxrwuejaoipbdl.jpg "Jade Theme")

```dart
gobanController = GobanController(
    boardSize: boardSize, gobanTheme: GobanTheme.jadeTheme());
```

## Todo

* Stone shadow when while pressing down
* Ability to show just one corner (like SmartGo on iOS)
* Coordinates
* SGF support
