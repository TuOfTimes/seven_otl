import 'package:seven_otl/model/team.dart';
import 'package:flutter/material.dart';

class TeamInfo extends StatelessWidget {
  final Team team =
      Team(nickname: "MUT", teamName: "McGill Ultimate Team", year: 2019);
  TeamInfo({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
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
                  team.teamName + " " + team.year.toString(),
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
