import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:score_savvy_app/notifiers/players_notifier.dart';


class AdjustPointsForm extends ConsumerWidget {
  AdjustPointsForm({super.key, required this.playerIndex ,required this.isAdding});

  final pointsController = TextEditingController();
  bool isAdding;
  int playerIndex;

  void adjustPoints(BuildContext context, WidgetRef ref){
    if (isAdding){
      ref.read(playersNotifierProvider.notifier)
        .addPointsToScore(playerIndex, (pointsController.text == '') ? 1 : int.parse(pointsController.text));
    } 
    else {
      ref.read(playersNotifierProvider.notifier).
        removePointsFromScore(playerIndex, (pointsController.text == '') ? 1 : int.parse(pointsController.text));
    }
    Navigator.of(context).pop();
  }
 
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      backgroundColor: (isAdding) ? Color.fromARGB(255, 188, 226, 212) : Color.fromARGB(255, 246, 230, 229),
      scrollable: true,
      title: const Text('Adjust Points'),
      content: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              TextFormField(
                autofocus: true,
                controller: pointsController,
                decoration: InputDecoration(
                  labelText: "Points",
                  icon: Icon((isAdding) ? Icons.add_circle : Icons.do_disturb_on),
                  hintText: "1",
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
                keyboardType: TextInputType.number,
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
              adjustPoints(context, ref);
            },
        ),
      ],
    );
  }
}