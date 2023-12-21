import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:score_savvy_app/models/player_model.dart';
import 'package:score_savvy_app/notifiers/players_notifier.dart';

class SquareCard extends ConsumerWidget {
  final String playerName;
  final Color playerColor;
  final int playerIndex;

  SquareCard({Key? key, required this.playerName, required this.playerColor, required this.playerIndex}) : super(key: key);
  Color themeColor = const Color.fromARGB(255, 93, 143, 235); //put in provider

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Player> players = ref.watch(playersNotifierProvider);
    return Stack(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
          ),
          color: Color.fromARGB(255, 50, 47, 133),
          elevation: 3,
          margin: const EdgeInsets.all(8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  decoration: BoxDecoration(
                    color: themeColor,
                    borderRadius: const BorderRadius.all(Radius.circular(4))),
                  child: Text(
                    players[playerIndex].points.toString(),
                    style: const TextStyle(
                      fontSize: 22,
                      fontFamily: 'Wolfskin',
                      color: Colors.white
                    ),
                  ),
                ),
// START Points Action Buttons
                Row(
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 93, 143, 235),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                        child: TextButton(
                          onPressed: () {
                            ref.read(playersNotifierProvider.notifier).removePointsFromScore(playerIndex, 10);
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: const RoundedRectangleBorder()),
                          child: const Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: Container(
                        decoration: BoxDecoration(
                          color: themeColor,
                          borderRadius: const BorderRadius.all(Radius.circular(30))),
                        child: TextButton(
                          onPressed: () {
                            ref.read(playersNotifierProvider.notifier).addPointsToScore(playerIndex, 10);
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: const RoundedRectangleBorder()),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
// END Points Action Buttons
              ],
            ),
          ),
        ),
//START Player Name
        Positioned(
          left: 20,
          child: Container(
            constraints: BoxConstraints(minWidth: 93),
            padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: playerColor
            ),
            child: Center(
              child: Text(
                playerName,
                style: const TextStyle(
                  fontFamily: 'Wolfskin',
                  fontSize: 16,
                  color: Colors.white
                ),
              ),
            ),
          ),
        ),
//END Player Name
      ]
    );
  }
}