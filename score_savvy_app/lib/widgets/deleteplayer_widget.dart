import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:score_savvy_app/notifiers/players_notifier.dart';


class DeletePlayerForm extends ConsumerWidget {
  DeletePlayerForm({super.key, required this.playerName, required this.playerIndex});

  String playerName;
  int playerIndex;
 
  void commitClear(BuildContext context, WidgetRef ref) {
    ref.read(playersNotifierProvider.notifier).removePlayer(playerIndex);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      scrollable: true,
      title: Center(child: const Text('Delete Player?')),
      content: Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                children: [
                  const TextSpan(
                    text: "Are you sure you want to delete ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12
                    ),
                  ),
                  TextSpan(
                    text: "$playerName?",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ]
              )) 
            ],
          ),
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(
            style: TextButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 222, 112, 148),
            ),
            child: const Text("Cancel",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
        ),
        TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 97, 200, 166),
            ),
            child: const Text("Confirm",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              commitClear(context, ref);
            },
        ),
      ],
    );
  }
}