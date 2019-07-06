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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(DocumentSnapshot document) => ListTile(
        // use this to specify win (W) or loss (L)

        leading: Container(
          child: Text(document['number'].toString(),
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17)),
        ),

        // title should specify score
        title: Text(
          document['name'],
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

        subtitle: Row(
          children: <Widget>[
            Expanded(
                flex: 4,
                child: Text(document['line'] + " - " + document['position'],
                    style: TextStyle(color: Colors.black))),
          ],
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PlayerDetailPage(
                        document: document,
                      )));
        },
        dense: true);

    Card makeCard(BuildContext context, DocumentSnapshot document) => Card(
          elevation: 1,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
              decoration: BoxDecoration(color: Colors.transparent),
              child: makeListTile(document)),
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
        child: StreamBuilder(
            stream: Firestore.instance.collection('players').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Loading...');
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data.documents.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index < snapshot.data.documents.length)
                    return makeCard(context, snapshot.data.documents[index]);
                  return makeNewPlayerCard();
                },
              );
            }));

    return makeBody;
  }
}
