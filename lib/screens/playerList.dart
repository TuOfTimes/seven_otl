import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:seven_otl/model/player.dart';
import 'package:seven_otl/screens/newPlayer.dart';
import 'package:seven_otl/screens/playerDetail.dart';

class PlayerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListPage(title: 'MUT 2019 Playerss');
  }
}

class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List players;

  @override
  void initState() {
    players = getPlayers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(Player player) => ListTile(
        // use this to specify win (W) or loss (L)

        leading: Container(
          child: Text(player.number,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17)),
        ),

        // title should specify score
        title: Text(
          player.firstName + " " + player.lastName,
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

        subtitle: Row(
          children: <Widget>[
            Expanded(
                flex: 4,
                child: Text(player.getLine() + " - " + player.getPosition(),
                    style: TextStyle(color: Colors.black))),
          ],
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PlayerDetailPage(
                        player: player,
                      )));
        },
        dense: true);

    Card makeCard(Player player) => Card(
          elevation: 1,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
              decoration: BoxDecoration(color: Colors.transparent),
              child: makeListTile(player)),
        );

    Card makeNewPlayerCard() => Card(
          elevation: 1,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.grey[300]),
            child: ListTile(
                leading: Container(
                  child: Text("+",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17)),
                ),

                // title should specify score
                title: Text(
                  "Add Player",
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
                // subtitle: Row(
                //   children: <Widget>[
                //     Expanded(
                //         flex: 4,
                //         child: Text("Line - Position",
                //             style: TextStyle(color: Colors.black))),
                //   ],
                // ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewPlayer()));
                },
                dense: true),
          ),
        );

    final makeBody = Container(
      alignment: Alignment(0, -1),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: players.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index < players.length) return makeCard(players[index]);
          return makeNewPlayerCard();
        },
      ),
    );

    return makeBody;
  }
}

List getPlayers() {
  return [
    Player(
        line: Line.offense,
        position: Position.handler,
        firstName: "Edward",
        lastName: "Tu",
        number: "2"),
    Player(
        line: Line.offense,
        position: Position.handler,
        firstName: "Thomas",
        lastName: "Griffin",
        number: "3"),
    Player(
        line: Line.offense,
        position: Position.handler,
        firstName: "Thomas",
        lastName: "McAlear",
        number: "4"),
    Player(
        line: Line.offense,
        position: Position.handler,
        firstName: "Paul",
        lastName: "Hooley",
        number: "6"),
    Player(
        line: Line.offense,
        position: Position.handler,
        firstName: "Elias",
        lastName: "Hess-Childs",
        number: "7"),
    Player(
        line: Line.offense,
        position: Position.handler,
        firstName: "Gabriel",
        lastName: "Gefter",
        number: "8"),
    Player(
        line: Line.offense,
        position: Position.handler,
        firstName: "Hayden",
        lastName: "Stone",
        number: "14"),
    Player(
        line: Line.offense,
        position: Position.handler,
        firstName: "Christos",
        lastName: "Cunning",
        number: "15"),
    Player(
        line: Line.offense,
        position: Position.handler,
        firstName: "Thomas",
        lastName: "Ronson",
        number: "23"),
    Player(
        line: Line.offense,
        position: Position.handler,
        firstName: "Vincent",
        lastName: "Lee",
        number: "24"),
    Player(
        line: Line.offense,
        position: Position.handler,
        firstName: "Thomas",
        lastName: "Wright",
        number: "26"),
    Player(
        line: Line.offense,
        position: Position.handler,
        firstName: "Jack",
        lastName: "Eagles",
        number: "27"),
    Player(
        line: Line.offense,
        position: Position.handler,
        firstName: "Jordan",
        lastName: "Faries",
        number: "28"),
    Player(
        line: Line.offense,
        position: Position.handler,
        firstName: "Brenden",
        lastName: "Kadota",
        number: "33"),
    Player(
        line: Line.offense,
        position: Position.handler,
        firstName: "Calvin",
        lastName: "Coulbury",
        number: "37"),
    Player(
        line: Line.offense,
        position: Position.handler,
        firstName: "Christophe",
        lastName: "Tremblay-Joncas",
        number: "44"),
    Player(
        line: Line.offense,
        position: Position.handler,
        firstName: "Albert",
        lastName: "Kragl",
        number: "47"),
    Player(
        line: Line.offense,
        position: Position.handler,
        firstName: "Angus",
        lastName: "Boswell",
        number: "50"),
    Player(
        line: Line.offense,
        position: Position.handler,
        firstName: "Adam",
        lastName: "Gosselin",
        number: "50"),
    Player(
        line: Line.offense,
        position: Position.handler,
        firstName: "Elliot",
        lastName: "Wong",
        number: "60"),
    Player(
        line: Line.offense,
        position: Position.handler,
        firstName: "Timmy",
        lastName: "Woo",
        number: "71"),
  ];
}
