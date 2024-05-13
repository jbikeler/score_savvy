import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:score_savvy_app/models/player_model.dart';
import 'package:score_savvy_app/notifiers/players_notifier.dart';
import 'package:score_savvy_app/notifiers/settings_notifier.dart';
import 'package:score_savvy_app/widgets/add_points_widget.dart';
import 'package:score_savvy_app/widgets/deleteplayer_widget.dart';

class SquareCard extends ConsumerWidget {
  Color themeColor = const Color.fromARGB(255, 93, 143, 235); //put in provider
  final String playerName;
  final Color playerColor;
  final int playerIndex;

  SquareCard({Key? key, required this.playerName, required this.playerColor, required this.playerIndex}) : super(key: key);

  void addPoints(BuildContext context, WidgetRef ref) async {
    print(ref.read(settingsNotifierProvider).adjustAmount);
    ref.read(playersNotifierProvider.notifier)
      .addPointsToScore(playerIndex, ref.read(settingsNotifierProvider).adjustAmount);
  }

  void subtractPoints(BuildContext context, WidgetRef ref) async {
    ref.read(playersNotifierProvider.notifier)
      .removePointsFromScore(playerIndex, ref.read(settingsNotifierProvider).adjustAmount);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    double colorLuminance = playerColor.computeLuminance();

    List<Player> players = ref.watch(playersNotifierProvider);
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
          child: Card(
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
                          child: GestureDetector(
                            onTap: () {
                              subtractPoints(context, ref);
                            },
                            onLongPress: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AdjustPointsForm(playerIndex: playerIndex, isAdding: false,);
                                }
                              );
                            },
                            child: TextButton(
                              onPressed: null, // Disable the onPressed property of the TextButton
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                shape: const RoundedRectangleBorder()),
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                          )
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
                          child: GestureDetector(
                            onTap: () {
                              addPoints(context, ref);
                            },
                            onLongPress: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AdjustPointsForm(playerIndex: playerIndex, isAdding: true,);
                                }
                              );
                            },
                            child: TextButton(
                              onPressed: null, // Disable the onPressed property of the TextButton,
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
                      ),
                    ],
                  ),
        // END Points Action Buttons
                ],
              ),
            ),
          ),
        ),
//START Player Name
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  constraints: const BoxConstraints(minWidth: 93),
                  padding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: playerColor
                  ),
                  child: Center(
                    child: Text(
                      playerName,
                      style: TextStyle(
                        fontFamily: 'Wolfskin',
                        fontSize: 16,
                        color: colorLuminance < 0.5 ? Colors.white : const Color.fromARGB(255, 38, 38, 38),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
        
//END Player Name
        Positioned(
          left: 80,
          child: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return DeletePlayerForm(playerName: playerName, playerIndex: playerIndex,);
              });
          },
          icon: const Icon(
            Icons.remove_circle,
            color: Color.fromARGB(255, 238, 84, 72),
          )
          )
        ),
      ]
    );
  }
}