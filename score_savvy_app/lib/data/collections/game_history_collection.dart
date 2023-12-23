import 'package:isar/isar.dart';

part 'game_history_collection.g.dart';

@collection
class GameHistory {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  String? name;

  int? round;

  List<PlayerHistory>? players;
}

@embedded 
class PlayerHistory {
  PlayerHistory({
    this.name,
    this.points,
    this.color
  });
  String? name;
  int? points;
  String? color;
}