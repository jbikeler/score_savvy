import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:score_savvy_app/models/player_model.dart';
import 'package:score_savvy_app/notifiers/gamename_notifier.dart';
import 'package:score_savvy_app/notifiers/players_notifier.dart';
import 'package:score_savvy_app/notifiers/roundcount_notifier.dart';
import 'package:score_savvy_app/providers/colortheme_provider.dart';
import 'package:score_savvy_app/widgets/add_player_widget.dart';
import 'package:score_savvy_app/widgets/clearform_widgets.dart';
import 'package:score_savvy_app/widgets/gameform_widget.dart';
import 'package:score_savvy_app/widgets/savegame_widget.dart';
import 'package:score_savvy_app/widgets/squarecard_widget.dart';

class HomePage extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 20, 58),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              color: const Color.fromARGB(255, 15, 20, 58),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return GameNameForm();
                          });
                      },
                      child: Consumer(builder: (context, ref, child) { return Text(
                            ref.watch(gameNameNotifierProvider),
                            style: const TextStyle(
                              fontFamily: 'Scrubland',
                              color: Colors.white,
                              fontSize: 35
                            ),
                          );
                       },
                      ),
                    )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                        Navigator.pushNamed(context, "/settings");
                        },
                        child: const Icon(Icons.settings)
                      ),
                      TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return SaveDataForm();
                            });
                        },
                        child: const Icon(Icons.save)
                      ),
                      TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return ClearAllForm();
                            });
                        },
                        child: const Icon(Icons.delete)
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/histories");
                        },
                        child: const Icon(Icons.history)
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
//START Round Header
                  Consumer(builder: (context, ref, child) { return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
//START Decrement Round Btn
                      SizedBox(
                        width: 40,
                        height: 40,
                        
                        child: Container(
                          decoration: BoxDecoration(
                            color: ref.read(appThemeColorProvider),
                            borderRadius: const BorderRadius.all(Radius.circular(30))),
                          child: TextButton(
                            onPressed: () {
                              //decrement Round
                              ref.read(roundNotifierProvider.notifier).countDown();
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
//END Decrement Round Btn
//START Round Text
                      Text(
                        'Round ${ref.watch(roundNotifierProvider)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Wolfskin',
                          fontSize: 28,
                        ),
                      ),
//END Round Text
//START Increment Round Btn
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: Container(
                          decoration: BoxDecoration(
                            color: ref.read(appThemeColorProvider),
                            borderRadius: const BorderRadius.all(Radius.circular(30))),
                          child: TextButton(
                            onPressed: () {
                              //increment Round
                              ref.read(roundNotifierProvider.notifier).countUp();
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
//END Increment Round Btn
                    ],
                  ); },),
//END Round Header
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Consumer(builder: (context, ref, child) { 
                    List<Player> players = ref.watch(playersNotifierProvider);
                    return GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3, // You can change this value to adjust the number of columns
                    shrinkWrap: true,
                    children: List.generate(players.length, (index) {
                      return Center(
                        child: SquareCard(playerName: players[index].name, playerColor: players[index].color, playerIndex: index,),
                      );
                    }),
                  ); },),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Consumer(builder: (context, ref, child) { return FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CreatePlayerDialog();
            });
        },
        backgroundColor: ref.read(appThemeColorProvider),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ); },),
    );
  }
}
