class Player {
  String firstName;
  String lastName;
  String number;
  Line line;
  Pod pod;
  Position position;

  Player(
      {this.firstName,
      this.lastName,
      this.number,
      this.line,
      this.pod,
      this.position});

  String getPod() {
    switch (this.pod) {
      case Pod.podA:
        return "Pod A";
      case Pod.podB:
        return "Pod B";
      default:
        return "";
    }
  }

  String getLine() {
    switch (this.line) {
      case Line.offense:
        return "O Line";
      case Line.defense:
        return "D Line";
      default:
        return "";
    }
  }

  String getPosition() {
    switch (this.position) {
      case Position.cutter:
        return "Cutter";
      case Position.handler:
        return "Handler";
      case Position.hybrid:
        return "Hybrid";
      default:
        return "";
    }
  }
}

enum Line { offense, defense }

enum Pod { podA, podB }

enum Position { handler, cutter, hybrid }
