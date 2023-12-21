import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class TaskForm extends StatelessWidget {
  TaskForm({super.key});

  final gameNameController = TextEditingController();

  void deleteTask(BuildContext context){
    print("need delete logic: gameform_widget.dart -> deleteTask()");
  }
 
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: const Text('Game Info'),
      content: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              TextFormField(
                controller: gameNameController,
                decoration: const InputDecoration(
                  labelText: "Game Name",
                  icon: Icon(Icons.task),
                  hintText: 'Enter Game Name',
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(25),
                ],
              ),
            ],
          ),
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
//START Cancel Button
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
//END Cancel Button
        // Consumer(
        //   builder: (context, value, child) => TextButton(
        //     style: TextButton.styleFrom(
        //       backgroundColor: const Color.fromARGB(255, 70, 195, 128),
        //     ),
        //     child: const Text("Create",
        //       style: TextStyle(color: Colors.white),
        //     ),
        //     onPressed: () {
        //       createTask(context);
        //     },
        //   ),
        // ),
      ],
    );
  }
}

