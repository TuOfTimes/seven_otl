import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class GameDetailPage extends StatelessWidget {
  final DocumentSnapshot document;
  final DateFormat date = new DateFormat("yyyy-MM-dd");
  GameDetailPage({Key key, this.document}) : super(key: key);
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
                  date.format(new DateTime.fromMillisecondsSinceEpoch(
                      document['time'].millisecondsSinceEpoch)),
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15.0),
                Text(
                  document['complete'].toString() +
                      " vs. " +
                      document['awayTeam'],
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15.0),
                Text(
                  document['homeScore'].toString() +
                      " - " +
                      document['awayScore'].toString(),
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
