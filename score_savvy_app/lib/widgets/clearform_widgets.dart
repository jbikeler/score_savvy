import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:score_savvy_app/notifiers/gamename_notifier.dart';
import 'package:score_savvy_app/notifiers/players_notifier.dart';
import 'package:score_savvy_app/notifiers/roundcount_notifier.dart';


class ClearAllForm extends ConsumerWidget {
  ClearAllForm({super.key});


 
  void commitClear(BuildContext context, WidgetRef ref) {
    ref.invalidate(gameNameNotifierProvider);
    ref.invalidate(roundNotifierProvider);
    ref.invalidate(playersNotifierProvider);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      scrollable: true,
      title: Center(child: const Text('Clear Data?')),
      content: const Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Text("Are you sure you want to clear game? This will remove all players without saving.",
              textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12
                ),
              ),
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