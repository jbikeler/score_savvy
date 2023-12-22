import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
//Tables
import 'package:score_savvy_app/data/tables/histories_gamedata_table.dart';
import 'package:score_savvy_app/data/tables/histories_players_table.dart';

part 'database.g.dart';

@DriftDatabase(tables: [PlayerItems, GameItems, ]) //Tables go here
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  //History Players Table Db Helpers
  Future<List<PlayerItem>> getPlayers() async {
    return await select(playerItems).get();
  }

  Stream<List<PlayerItem>> getPlayersStream() {
    return select(playerItems).watch();
  }

  Future<PlayerItem> getPlayerItem(int id) async { 
    return await (select(playerItems)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  Future<bool> updatePlayer(PlayerItemsCompanion entity) async {
    return await update(playerItems).replace(entity);
  }

  Future<int> addPlayer(PlayerItemsCompanion entry) async {
    return await into(playerItems).insert(entry);
  }
  
  Future<int> deletePlayer(int id) async {
    return await (delete(playerItems)..where((tbl) => tbl.id.equals(id))).go();
  }

  //History GameData Table Db Helpers
  Future<List<GameItem>> getGames() async {
    return await select(gameItems).get();
  }

  Stream<List<GameItem>> getGamesStream() {
    return select(gameItems).watch();
  }

  Future<GameItem> getGameItem(int id) async { 
    return await (select(gameItems)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  Future<bool> updateGame(GameItemsCompanion entity) async {
    return await update(gameItems).replace(entity);
  }

  Future<int> addGame(GameItemsCompanion entry) async {
    return await into(gameItems).insert(entry);
  }
  
  Future<int> deleteGame(int id) async {
    return await (delete(gameItems)..where((tbl) => tbl.id.equals(id))).go();
  }



}


LazyDatabase _openConnection() {
return LazyDatabase(() async {
  final dbFolder = await getApplicationDocumentsDirectory();
  final file = File(p.join(dbFolder.path, 'db.sqlite'));

  return NativeDatabase.createInBackground(file);
});
}