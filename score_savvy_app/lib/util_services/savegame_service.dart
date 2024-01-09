import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:score_savvy_app/data/collections/game_current_collection.dart';
import 'package:score_savvy_app/data/collections/game_history_collection.dart';
import 'package:score_savvy_app/data/collections/settings_collection.dart';
import 'package:score_savvy_app/models/player_model.dart';
import 'package:score_savvy_app/models/settings_model.dart';
import 'package:score_savvy_app/notifiers/gamename_notifier.dart';
import 'package:score_savvy_app/notifiers/players_notifier.dart';
import 'package:score_savvy_app/notifiers/roundcount_notifier.dart';

class SaveService {
  SaveService(){
    print('savegame_service.dart: init was run');
  }
  
  late Isar db;

  //Needs to be run when instantiated
  Future<bool> init() async{
    Isar isar = await Isar.open([
    //collection schemas here
    GameHistorySchema,
    GameCurrentSchema,
    SavedSettingSchema
    ],
    inspector: true, //toggle off for production
    name: 'db_instance', directory: (await getApplicationDocumentsDirectory()).path,);
    db = isar;
    print('savegame_service.dart: db was set');
    return true;
  }

  //Currently there is only two settings so it's OK to return the entire settings object.
  //If the app is scaled anymore as far as settings go the callbacks should probably be
  //separated into returning individual settings
  Future<AppSettings> getAppSettings() async { 
    SavedSetting? saved = await db.savedSettings.get(1);
    if (saved != null) {
      if (saved.quickAdjust != null && saved.adjustAmount != null ) {
        return AppSettings(
          useQuickAdjust: saved.quickAdjust!,
          adjustAmount: saved.adjustAmount!
        );
      }
      else {
        return AppSettings(
          useQuickAdjust: true,
          adjustAmount: 1
        );
      }
    }
    else {
      return AppSettings(
          useQuickAdjust: true,
          adjustAmount: 1
        );
    }
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

  Future<String> getCurrentName() async {
    GameCurrent? currentData = await db.gameCurrents.get(1);
    if (currentData != null) {
      if (currentData.name != null ) {
        return currentData.name!;
      }
      else {
        return 'New Game';
      }
    }
    else {
      return 'New Game';
    }
  }

  Future<int> getCurrentRound() async {
    GameCurrent? currentData = await db.gameCurrents.get(1);
    if (currentData != null) {
      if (currentData.round != null ) {
        return currentData.round!;
      }
      else {
        return 0;
      }
    }
    else {
      return 0;
    }
  }

  Future<List<GameHistory>> getHistories() {
    print('getting histories');
    return db.gameHistorys.where().findAll();
  }

  Future<void> updatePlayers(List<Player> newPlayerList) async {
    try {
      await db.writeTxn(() async {
        final existingSlot = await db.gameCurrents.get(1);
        if (existingSlot != null){ //if exists
          existingSlot.players = convertToPCurrent(newPlayerList); //convert passed List<Player> and set it as the new players var in db
          await db.gameCurrents.put(existingSlot); //'put' it back in the db (updates exiting entry in Isar database)
        }
        else { //if it doesn't exist
          initCurrent(players: convertToPCurrent(newPlayerList)); //just add new currentGame object
        }
      });
    } catch (e) {
      print('Database update error: $e');
      // Handle error accordingly
    }
  }
  
  Future<void> updateGameName(String newName) async {
    try {
      await db.writeTxn(() async {
        final existingSlot = await db.gameCurrents.get(1);
        if (existingSlot != null){ //if exists
          existingSlot.name = newName; //Set the existing name as the newName value
          await db.gameCurrents.put(existingSlot); //'put' it back in the db (updates exiting entry in Isar database)
        }
        else { //if it doesn't exist
          initCurrent(name: newName); //just add new currentGame object
        }
      });
    } catch (e) {
      print('Database update error: $e');
      // Handle error accordingly
    }
  }

  Future<void> updateRound(int newRound) async {
    try {
      await db.writeTxn(() async {
        final existingSlot = await db.gameCurrents.get(1);
        if (existingSlot != null){ //if exists
          existingSlot.round = newRound; //Set the saved round as the newRound value
          await db.gameCurrents.put(existingSlot); //'put' it back in the db (updates exiting entry in Isar database)
        }
        else { //if it doesn't exist
          initCurrent(round: newRound); //just add new currentGame object
        }
      });
    } catch (e) {
      print('Database update error: $e');
      // Handle error accordingly
    }
  }
  
  Future<void> updateSettings(AppSettings newSettings) async {
    try {
      await db.writeTxn(() async {
        final existingSlot = await db.savedSettings.get(1);
        if (existingSlot != null){ //if exists
          existingSlot.quickAdjust = newSettings.useQuickAdjust; //Set the quick adjust setting
          existingSlot.adjustAmount = newSettings.adjustAmount; //Set the quick adjust setting
          await db.savedSettings.put(existingSlot); //'put' it back in the db (updates exiting entry in Isar database)
        }
        else { //if it doesn't exist
          initSettings(newSettings); //just add new currentGame object
        }
      });
    } catch (e) {
      print('Database update error: $e');
      // Handle error accordingly
    }
  }

  //If no file Exists for the current game, this function should dynamically initiate it.
  //Depending on which change the user makes first, the information passed enter the parameters will differ from where this is called.
  // For example, If the first change the user makes is adding Players then the defaults will be set for everything but the new player list
  void initCurrent({String name = 'New Game', int round = 0, List<PlayerCurrent>? players}) async{
    GameCurrent firstGame =  GameCurrent(
      id: 1,  //needs to have id = 1. 
      name: name,
      round: round,
      players: players ?? []
    );
    await db.gameCurrents.put(firstGame);
  }

  void initSettings(AppSettings newSettings) async{
    SavedSetting firstSettings =  SavedSetting(
      id: 1,  //needs to have id = 1. 
      quickAdjust: newSettings.useQuickAdjust,
      adjustAmount: newSettings.adjustAmount,
    );
    await db.savedSettings.put(firstSettings);
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
