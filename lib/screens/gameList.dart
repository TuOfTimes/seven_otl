import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:seven_otl/screens/gameDetail.dart';
import 'package:seven_otl/screens/newGame.dart';

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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(DocumentSnapshot document) => ListTile(
          // contentPadding:
          //     EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          // use this to specify win (W) or loss (L)

          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right:
                        new BorderSide(width: 1.0, color: Colors.grey[500]))),
            child: Text('W',
                style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontFamily: 'RobotoMono')),
          ),

          // title should specify score
          title: Text(
            "vs. " + document['awayTeam'],
            style:
                TextStyle(color: Colors.grey[800], fontWeight: FontWeight.bold),
          ),
          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.grey[800])),

          subtitle: Row(
            children: <Widget>[
              Expanded(
                  flex: 4,
                  child: Text(
                      document['homeScore'].toString() +
                          " - " +
                          document['awayScore'].toString(),
                      style: TextStyle(color: Colors.grey[800]))),
            ],
          ),
          trailing: Icon(Icons.keyboard_arrow_right,
              color: Colors.grey[800], size: 30.0),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GameDetailPage(document: document)));
          },
        );

    Card makeCard(BuildContext context, DocumentSnapshot document) => Card(
          elevation: 5.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.transparent),
            child: makeListTile(document),
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
                    MaterialPageRoute(builder: (context) => NewGame()));
              },
            )));

    final makeBody = Container(
        alignment: Alignment(0, -1),
        child: StreamBuilder(
            stream: Firestore.instance.collection('games').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Loading...');
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data.documents.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  List list = snapshot.data.documents.toList();
                  list.sort((a, b) {
                    return b['time'].compareTo(a['time']);
                  });
                  if (index == 0) return makeNewGameCard();
                  return makeCard(context, list[index - 1]);
                },
              );
            }));

    return makeBody;
  }
}
