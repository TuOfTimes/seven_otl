import 'package:flutter/material.dart';
import 'package:seven_otl/frisbeeIcon.dart';
import 'screens/playerList.dart';
import 'screens/gameList.dart';
import 'screens/teamInfo.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Seven On The Line',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SevenOTL(),
    );
  }
}

class SevenOTL extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 600,
        width: double.infinity,
        child: DefaultTabController(
            length: 3,
            child: Scaffold(
                appBar: AppBar(
                  elevation: 0.0,
                  backgroundColor: Colors.transparent,
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(55),
                    child: Container(
                      color: Colors.transparent,
                      child: SafeArea(
                        child: Column(
                          children: <Widget>[
                            TabBar(
                                indicator: UnderlineTabIndicator(
                                    borderSide: BorderSide(
                                        color: Color(0xffff0863), width: 4.0),
                                    insets: EdgeInsets.fromLTRB(
                                        40.0, 20.0, 40.0, 0)),
                                indicatorWeight: 15,
                                indicatorSize: TabBarIndicatorSize.label,
                                labelColor: Color(0xff2d386b),
                                labelStyle: TextStyle(
                                    fontSize: 12,
                                    letterSpacing: 1.3,
                                    fontWeight: FontWeight.w500),
                                unselectedLabelColor: Colors.black26,
                                tabs: [
                                  Tab(
                                    text: "ROSTER",
                                    icon: Icon(Icons.supervised_user_circle,
                                        size: 40),
                                  ),
                                  Tab(
                                    text: "MANAGE",
                                    icon: Icon(Icons.assessment, size: 40),
                                  ),
                                  Tab(
                                    text: "GAMES",
                                    icon:
                                        Icon(FrisbeeIcon.big_frisbee, size: 40),
                                  ),
                                ])
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                body: TabBarView(
                  children: <Widget>[
                    Center(
                      child: PlayerList(),
                    ),
                    Center(
                      child: TeamInfo(),
                    ),
                    Center(
                      child: GameList(),
                    ),
                  ],
                ))));
  }
}
