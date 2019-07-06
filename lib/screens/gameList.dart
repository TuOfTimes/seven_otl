import 'package:flutter/material.dart';

import 'package:seven_otl/model/game.dart';
import 'package:seven_otl/screens/gameDetail.dart';

class GameList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListPage(title: 'MUT 2019 Games');
  }
}

class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List games;

  @override
  void initState() {
    games = getGames();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(Game game) => ListTile(
          // contentPadding:
          //     EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          // use this to specify win (W) or loss (L)

          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right:
                        new BorderSide(width: 1.0, color: Colors.grey[500]))),
            child: Text(game.getResultLetter(),
                style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontFamily: 'RobotoMono')),
          ),

          // title should specify score
          title: Text(
            "vs. " + game.opponent,
            style:
                TextStyle(color: Colors.grey[800], fontWeight: FontWeight.bold),
          ),
          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.grey[800])),

          subtitle: Row(
            children: <Widget>[
              Expanded(
                  flex: 4,
                  child: Text(
                      game.teamScore.toString() +
                          " - " +
                          game.opponentScore.toString(),
                      style: TextStyle(color: Colors.grey[800]))),
            ],
          ),
          trailing: Icon(Icons.keyboard_arrow_right,
              color: Colors.grey[800], size: 30.0),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GameDetailPage(game: game)));
          },
        );

    Card makeCard(Game game) => Card(
          elevation: 5.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.transparent),
            child: makeListTile(game),
          ),
        );

    Card makeNewGameCard() => Card(
        elevation: 1,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
            decoration: BoxDecoration(color: Colors.grey[300]),
            child: ListTile(
              leading: Container(
                padding: EdgeInsets.only(right: 12.0),
                decoration: new BoxDecoration(
                    border: new Border(
                        right: new BorderSide(
                            width: 1.0, color: Colors.grey[500]))),
                child: Text("+",
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        fontFamily: 'RobotoMono')),
              ),

              // title should specify score
              title: Text(
                "New Game",
                style: TextStyle(
                    color: Colors.grey[800], fontWeight: FontWeight.bold),
              ),
              // subtitle:
              //     Text("0 - 0", style: TextStyle(color: Colors.grey[800])),
              trailing: Icon(Icons.keyboard_arrow_right,
                  color: Colors.grey[800], size: 30.0),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GameDetailPage()));
              },
            )));

    final makeBody = Container(
      alignment: Alignment(0, -1),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: games.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) return makeNewGameCard();
          return makeCard(games[index - 1]);
        },
      ),
    );

    return makeBody;
  }
}

List getGames() {
  return [
    Game(
      dateTime: DateTime.now(),
      opponent: "Western",
      result: Result.win,
      teamScore: 15,
      opponentScore: 7,
    ),
    Game(
      dateTime: DateTime.now(),
      opponent: "League of Shadows",
      result: Result.loss,
      teamScore: 10,
      opponentScore: 13,
    ),
    Game(
      dateTime: DateTime.now(),
      opponent: "Queens",
      result: Result.unfinished,
      teamScore: 8,
      opponentScore: 7,
    )
  ];
}
