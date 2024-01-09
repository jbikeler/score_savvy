import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:score_savvy_app/notifiers/settings_notifier.dart';


class AdjustIncrementForm extends ConsumerWidget {
  AdjustIncrementForm({super.key,});

  final amountController = TextEditingController();
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      scrollable: true,
      title: const Text('Adjust Amount'),
      content: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              TextFormField(
                autofocus: true,
                controller: amountController,
                decoration: InputDecoration(
                  labelText: "Amount To Increment By",
                  icon: const Icon(Icons.numbers),
                  hintText: ref.read(settingsNotifierProvider).adjustAmount.toString(),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(3),
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
              backgroundColor: const Color.fromARGB(255, 97, 200, 166),
            ),
            child: const Text("Confirm",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              ref.read(settingsNotifierProvider.notifier).setAdjustAmount(int.parse(amountController.text));
              Navigator.pop(context);
            },
        ),
      ],
    );
  }
}