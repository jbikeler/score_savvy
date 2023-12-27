import 'package:flutter/material.dart';

class Player {
  String name;
  int points;
  Color color;

  Player({required this.name, required this.color, this.points = 0});

  void addPoints(int amount){
    points += amount;
  }

  void removePoints(int amount){
    points -= amount;
  }
}