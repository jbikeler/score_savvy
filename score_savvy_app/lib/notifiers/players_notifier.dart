import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:score_savvy_app/data/collections/game_history_collection.dart';
import 'package:score_savvy_app/locator.dart';
import 'package:score_savvy_app/models/player_model.dart';

part 'players_notifier.g.dart';

@riverpod
class PlayersNotifier extends _$PlayersNotifier {

  final db = locator.get<Isar>();

  @override
  List<Player> build() {
    return [];
  }

  void addPlayer(String playerName, Color playerColor) {
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