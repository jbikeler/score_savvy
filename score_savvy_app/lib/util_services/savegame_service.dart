import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:score_savvy_app/data/collections/game_current_collection.dart';
import 'package:score_savvy_app/data/collections/game_history_collection.dart';
import 'package:score_savvy_app/models/player_model.dart';
import 'package:score_savvy_app/notifiers/gamename_notifier.dart';
import 'package:score_savvy_app/notifiers/players_notifier.dart';
import 'package:score_savvy_app/notifiers/roundcount_notifier.dart';

class SaveService {
  
  late Isar db;

  //Needs to be run when instantiated
  Future<Isar> init() async{
    Isar isar = await Isar.open([
    //collection schemas here
    GameHistorySchema,
    GameCurrentSchema,
    ],
    inspector: true, //toggle off for production
    name: 'db_instance', directory: (await getApplicationDocumentsDirectory()).path,);
    db = isar;
    return isar;
  }

  Future<List<Player>> getCurrentPlayers() async {
  GameCurrent? currentData = await db.gameCurrents.get(1);
  if (currentData != null) {
    List<PlayerCurrent>? playerList = currentData.players;
    if (playerList != null) {
      List<Player> newPlayers = [];
      playerList.forEach((element) {
        if (element.name != null && element.color != null && element.points != null) { //TODO: I believe I need to change my Isar Objects to be non nullable. That will simplify this function
          Player tempPlayer = Player(
            name: element.name!,
            color: Color(element.color!),
          );
          newPlayers.add(tempPlayer);
        }
      });
      return newPlayers;
    }
  }
  return []; // Return an empty list if no data or if data is null
}


  Future<void> updateCurrent(WidgetRef ref) async {
    List<PlayerCurrent> gamePlayers = convertToPCurrent(ref.read(playersNotifierProvider));
    int gameRound = ref.read(roundNotifierProvider);
    String gameName = ref.read(gameNameNotifierProvider);
    GameCurrent currentGame = GameCurrent(id: 1, name: gameName, round: gameRound, players: gamePlayers); //needs to have id = 1. 
    try {
      await db.writeTxn(() async {
        final exitingSlot = await db.gameCurrents.get(1);
        if (exitingSlot != null){ //if exists
          await db.gameCurrents.delete(1); //remove entry
          await db.gameCurrents.put(currentGame); //replace it with new currentGame object
        }
        else { //if it doesn't exist
          await db.gameCurrents.put(currentGame); //just add new currentGame object
        }
      });
    } catch (e) {
      print('Database update error: $e');
      // Handle error accordingly
    }
  }

  //Convert Player objects to PlayerHistory objects
  List<PlayerHistory> convertToPHistory(List<Player> players){
    List<PlayerHistory> playersList = [];
    players.forEach((element) { //loop through currrent players in player notifier and make a list of playerhistory's
      final player = PlayerHistory(
        name: element.name,
        points: element.points,
        color: element.color.value //value gets the color as an int
      );
      playersList.add(player);
    });
    return playersList;
  }

  //Convert Player objects to PlayerCurrent objects
  //TODO Currently I am not sure if I need to do this. Isar Classes are embedded and even though PlayerHistory objects and PlayerCurrent objects are identical I don't want to combine naming conventions. research and optimize in the future
  List<PlayerCurrent> convertToPCurrent(List<Player> players){ 
    List<PlayerCurrent> playersList = [];
    players.forEach((element) { //loop through currrent players in player notifier and make a list of playerhistory's
      final player = PlayerCurrent(
        name: element.name,
        points: element.points,
        color: element.color.value //value gets the color as an int
      );
      playersList.add(player);
    });
    return playersList;
  }

  void saveGameHistory(WidgetRef ref) async{
    List<PlayerHistory> gamePlayers = convertToPHistory(ref.read(playersNotifierProvider)); //has to be PlayerHistory because of Isar embedded class
    int gameRound = ref.read(roundNotifierProvider);
    String gameName = ref.read(gameNameNotifierProvider);
    GameHistory newHistory = GameHistory(name: gameName, round: gameRound, players: gamePlayers);
    await db.writeTxn(() async { //access Isar DB and add a gamehistory entry in db table
      await db.gameHistorys.put(newHistory);
      });
  }

}
