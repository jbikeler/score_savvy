import 'package:drift/drift.dart';

class CurrentGameItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 0, max: 32)();
  IntColumn get round => integer()();
}