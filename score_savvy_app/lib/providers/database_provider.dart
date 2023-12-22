import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:score_savvy_app/data/database.dart';

part 'database_provider.g.dart';

@riverpod
AppDatabase database(DatabaseRef ref) {
  final db = AppDatabase();
  return db;
}