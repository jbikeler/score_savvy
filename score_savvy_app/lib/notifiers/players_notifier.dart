import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:score_savvy_app/locator.dart';
import 'package:score_savvy_app/models/player_model.dart';
import 'package:score_savvy_app/util_services/savegame_service.dart';

part 'players_notifier.g.dart';

@riverpod
class PlayersNotifier extends _$PlayersNotifier {

  PlayersNotifier() {
    _initializeData();
  }

  Future<void> _initializeData() async { //In theory, this will initialize the state from the database
    List<Player> savePlayers = await locator.get<SaveService>().getCurrentPlayers();
    state = savePlayers;
  }

  @override
  List<Player> build() {
    return [];
  }

  void addPlayer(String playerName, Color playerColor) async {
    Player newPlayer = Player(name: playerName, color: playerColor);
    state = [...state, newPlayer];
  }
  
  void removePlayer(int playerIndex) {
    state.removeAt(playerIndex);
    state = [...state];
  }

  void addPointsToScore(int playerIndex, int amount) {
    final newState = [...state];
    newState[playerIndex].addPoints(amount);
    state = newState;
  }
  
  void removePointsFromScore(int playerIndex, int amount) {
    final newState = [...state];
    newState[playerIndex].removePoints(amount);
    state = newState;
  }

}