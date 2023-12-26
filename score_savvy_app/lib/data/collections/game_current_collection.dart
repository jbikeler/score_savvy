import 'package:isar/isar.dart';

part 'game_current_collection.g.dart';

@collection
class GameCurrent {
  GameCurrent({
    this.name,
    this.round,
    this.players,
  });

  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  String? name;
  int? round;
  List<PlayerCurrent>? players;
}

@embedded 
class PlayerCurrent {
  PlayerCurrent({
    this.name,
    this.points,
    this.color
  });
  String? name;
  int? points;
  int? color;
}