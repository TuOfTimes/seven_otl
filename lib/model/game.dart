class Game {
  DateTime dateTime;
  String opponent;
  Result result;
  int teamScore;
  int opponentScore;


  Game({this.dateTime, this.opponent, this.result=Result.unfinished, this.teamScore=0, this.opponentScore=0});
}

enum Result {
  win, loss, tie, unfinished
}