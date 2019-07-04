import 'package:flutter/material.dart';

import 'package:seven_otl/model/game.dart';
import 'package:seven_otl/screens/detail_page.dart';

class SecondTab extends StatelessWidget {
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
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
            child: Text(game.getResultLetter(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontFamily: 'RobotoMono')),
          ),

          // title should specify score
          title: Text(
            "vs. " + game.opponent,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

          subtitle: Row(
            children: <Widget>[
              Expanded(
                  flex: 4,
                  child: Text(
                      game.teamScore.toString() +
                          " - " +
                          game.opponentScore.toString(),
                      style: TextStyle(color: Colors.white))),
            ],
          ),
          trailing:
              Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => DetailPage()));
          },
        );

    Card makeCard(Game game) => Card(
          elevation: 5.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.grey),
            child: makeListTile(game),
          ),
        );

    final makeBody = Container(
        // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
        child: Column(children: <Widget>[
      // Text(
      //   widget.title,
      //   style: TextStyle(
      //     color: Colors.grey,
      //     fontWeight: FontWeight.bold,
      //     fontSize: 25),
      //   ),
      ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: games.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(games[index]);
        },
      ),
    ]));

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
