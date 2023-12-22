import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:score_savvy_app/notifiers/gamename_notifier.dart';
import 'package:score_savvy_app/notifiers/players_notifier.dart';


class GameNameForm extends ConsumerWidget {
  GameNameForm({super.key});

  final nameController = TextEditingController();

 
  void commitName(BuildContext context, WidgetRef ref) {
    ref.read(gameNameNotifierProvider.notifier).editName(nameController.text);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      scrollable: true,
      title: const Text('Game Title'),
      content: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              TextFormField(
                autofocus: true,
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Title",
                  icon: Icon(Icons.task),
                  hintText: ref.watch(gameNameNotifierProvider),
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(16),
                ],
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
              commitName(context, ref);
            },
        ),
      ],
    );
  }
}