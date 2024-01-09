import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:score_savvy_app/data/collections/game_history_collection.dart';

class GameHistoryWidget extends ConsumerWidget {
  const GameHistoryWidget({super.key, required this.gameData});

  final GameHistory gameData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 50, 47, 133),
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(3)
      ),
      child: Column(
        children: [
          Text(gameData.name!,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Wolfskin',
              fontSize: 25,
              ),
          ),
          Column(
            children: gameData.players!.map((player) {
              return Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.blueAccent,
                      width: 1
                    )
                  ),
                  color: Color.fromARGB(255, 50, 47, 133),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: Text(player.name!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Wolfskin'
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(player.points!.toString(),
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Wolfskin'
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
