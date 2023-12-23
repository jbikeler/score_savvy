import 'package:drift/drift.dart';

class PlayerItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get gameNameId => integer()();
  TextColumn get playerName => text().withLength(min: 0, max: 32)();
  IntColumn get points => integer()();
  TextColumn get playerColor => text()();
}