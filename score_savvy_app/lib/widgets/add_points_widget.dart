import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class TaskForm extends StatelessWidget {
  TaskForm({super.key});

  final nameController = TextEditingController();
  final pointsController = TextEditingController();

  void deleteTask(BuildContext context){
    print("need delete logic: add_points_widget.dart -> deleteTask()");
  }
 
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: const Text('New Task'),
      content: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Task Name",
                  icon: Icon(Icons.task),
                  hintText: 'New Task',
                ),
              ),
              TextFormField(
                controller: pointsController,
                decoration: const InputDecoration(
                  labelText: "Points",
                  icon: Icon(Icons.star),
                  hintText: "10",
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4),
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