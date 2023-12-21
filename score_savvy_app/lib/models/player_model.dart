import 'package:flutter/material.dart';

class Player {
  String name;
  int points = 0;
  Color color = Colors.red;

  Player({required this.name, required this.color});

  void addPoints(int amount){
    points += amount;
  }

  void removePoints(int amount){
    points -= amount;
  }
}