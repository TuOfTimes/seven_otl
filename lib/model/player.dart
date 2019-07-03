class Player {
  String firstName;
  String lastName;
  String number;
  Line line;
  Pod pod;

  Player({this.firstName, this.lastName, this.number});
}

enum Line {
  offense, defense
}

enum Pod {
  podA, podB
}