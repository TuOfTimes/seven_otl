import 'package:intl/intl.dart';

import 'package:seven_otl/model/game.dart';
import 'package:flutter/material.dart';

class GameDetailPage extends StatelessWidget {
  final Game game;
  final DateFormat date = new DateFormat("yyyy-MM-dd");
  GameDetailPage({Key key, this.game}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final button = PopupMenuButton<Options>(
      icon: Icon(Icons.more_vert, color: Colors.grey),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Options>>[
            const PopupMenuItem<Options>(
              value: Options.edit,
              child: Text('Edit'),
            ),
            const PopupMenuItem<Options>(
              value: Options.delete,
              child: Text('Delete'),
            ),
          ],
    );
    return new Scaffold(
        body: new Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Positioned(
          left: 30.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.grey),
          ),
        ),
        Positioned(
          right: 20.0,
          top: 47.0,
          child: button,
        ),
        Positioned(
            top: 100,
            child: Column(
              children: <Widget>[
                Text(
                  date.format(game.dateTime),
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15.0),
                Text(
                  game.getResult() + " vs. " + game.opponent,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15.0),
                Text(
                  game.teamScore.toString() +
                      " - " +
                      game.opponentScore.toString(),
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ))
      ],
    ));
  }
}

enum Options { edit, delete }
