import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:score_savvy_app/notifiers/players_notifier.dart';


class CreatePlayerDialog extends ConsumerWidget {
  CreatePlayerDialog({super.key});

  final nameController = TextEditingController();
  Color colorController = Colors.red;
  final pointsController = TextEditingController();// need to be color picker

  void createPlayer(WidgetRef ref) {
    ref.read(playersNotifierProvider.notifier)
      .addPlayer((nameController.text == '') ? 'player' : nameController.text, colorController);
  }
 
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      scrollable: true,
      title: const Text('New Player'),
      content: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              TextFormField(
                autofocus: true,
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  icon: Icon(Icons.task),
                  hintText: 'Player'
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(11)
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const Text("Player Color",
                style: TextStyle(
                  color: Color.fromARGB(255, 60, 60, 60),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialColorPicker(
                onColorChange: (Color color) {
                  colorController = color;
                },
                selectedColor: Colors.red,
                colors: [
                  Colors.red,
                  Colors.orange,
                  Colors.amber,
                  Colors.green,
                  Colors.blue,
                  Colors.indigo,
                  Colors.pink,
                  Colors.deepPurple
                ],
              )
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
              backgroundColor: Color.fromARGB(255, 80, 212, 168),
            ),
            child: const Text("Create",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              createPlayer(ref);
              Navigator.of(context).pop();
            },
        ),
      ],
    );
  }
}