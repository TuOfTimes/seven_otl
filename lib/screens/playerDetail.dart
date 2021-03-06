import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PlayerDetailPage extends StatelessWidget {
  final DocumentSnapshot document;
  PlayerDetailPage({Key key, this.document}) : super(key: key);
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
                Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: ExactAssetImage('assets/profile.png'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(75.0)),
                        boxShadow: [
                          BoxShadow(blurRadius: 3.0, color: Colors.grey)
                        ])),
                SizedBox(height: 60.0),
                Text(
                  document['number'].toString(),
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15.0),
                Text(
                  document['name'],
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15.0),
                Text(
                  document['line'] + " " + document['position'],
                  style: TextStyle(fontSize: 17.0),
                ),
              ],
            ))
      ],
    ));
  }
}

enum Options { edit, delete }
