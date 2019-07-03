import 'package:flutter/material.dart';

import 'package:seven_otl/model/player.dart';
import 'package:seven_otl/screens/detail_page.dart';

class FirstTab extends StatelessWidget {
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
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          // use this to specify win (W) or loss (L)

          leading: Container(
            child: Text(
              player.number,
              style: TextStyle(
                color: Colors.black, 
                fontWeight: FontWeight.bold,
                fontSize: 17)),
          ),

          // title should specify score
          title: Text(
            player.firstName + " " + player.lastName,
            style: TextStyle(
              color: Colors.black,
              fontSize: 17),
          ),
          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage()));
          },
          dense: true
        );

    Card makeCard(Player player) => Card(
          elevation: 0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.transparent),
            child: makeListTile(player),
          ),
        );

    final makeBody = Container(
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: players.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(players[index]);
        },
      ),
    );

    return makeBody;
  }
}

List getPlayers() {
  return [
    Player(
      firstName: "Edward",
      lastName: "Tu",
      number: "2"
      ),
    Player(
      firstName: "Thomas",
      lastName: "Griffin",
      number: "3"
      ),
    Player(
      firstName: "Thomas",
      lastName: "McAlear",
      number: "4"
      ),
    Player(
      firstName: "Paul",
      lastName: "Hooley",
      number: "6"
      ),
    Player(
      firstName: "Elias",
      lastName: "Hess-Childs",
      number: "7"
      ),
    Player(
      firstName: "Gabriel",
      lastName: "Gefter",
      number: "8"
      ),
    Player(
      firstName: "Hayden",
      lastName: "Stone",
      number: "14"
      ),
    Player(
      firstName: "Christos",
      lastName: "Cunning",
      number: "15"
      ),
    Player(
      firstName: "Thomas",
      lastName: "Ronson",
      number: "23"
      ),
    Player(
      firstName: "Vincent",
      lastName: "Lee",
      number: "24"
      ),
    Player(
      firstName: "Thomas",
      lastName: "Wright",
      number: "26"
      ),
    Player(
      firstName: "Jack",
      lastName: "Eagles",
      number: "27"
      ),
    Player(
      firstName: "Jordan",
      lastName: "Faries",
      number: "28"
      ),
    Player(
      firstName: "Brenden",
      lastName: "Kadota",
      number: "33"
      ),
    Player(
      firstName: "Calvin",
      lastName: "Coulbury",
      number: "37"
      ),
    Player(
      firstName: "Christophe",
      lastName: "Tremblay-Joncas",
      number: "44"
      ),
    Player(
      firstName: "Albert",
      lastName: "Kragl",
      number: "47"
      ),
    Player(
      firstName: "Angus",
      lastName: "Boswell",
      number: "50"
      ),
    Player(
      firstName: "Adam",
      lastName: "Gosselin",
      number: "50"
      ),
    Player(
      firstName: "Elliot",
      lastName: "Wong",
      number: "60"
      ),
    Player(
      firstName: "Timmy",
      lastName: "Woo",
      number: "71"
      ),     
  ];
}