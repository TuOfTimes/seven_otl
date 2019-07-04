class Game {
  DateTime dateTime;
  String opponent;
  Result result;
  int teamScore;
  int opponentScore;

  Game(
      {this.dateTime,
      this.opponent,
      this.result = Result.unfinished,
      this.teamScore = 0,
      this.opponentScore = 0});

  String getResultLetter() {
    switch (this.result) {
      case Result.win:
        return "W";
      case Result.loss:
        return "L";
      case Result.unfinished:
        return "-";
      case Result.tie:
        return "T";
      default:
        return "";
    }
  }
}

enum Result { win, loss, tie, unfinished }
