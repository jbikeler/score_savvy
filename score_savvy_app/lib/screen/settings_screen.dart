import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:score_savvy_app/notifiers/settings_notifier.dart';
import 'package:score_savvy_app/widgets/add_adjust_widget.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      
      return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Column(
            children: [
              const Center(child: Text(
                "Settings",
                style: TextStyle(
                  fontFamily: 'Scrubland',
                  fontSize: 35,
                ),
              )),
              CheckboxListTile(
                contentPadding: EdgeInsets.all(0),
                title: const Text('Use Quick Adjust'),
                value: ref.watch(settingsNotifierProvider).useQuickAdjust,
                onChanged: (bool? value) {
                  ref.read(settingsNotifierProvider.notifier).toggleQuickAdjust(value!);
                }
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Text(
                      'Amount',
                      style: TextStyle(
                        fontSize: 16,
                        color: (ref.watch(settingsNotifierProvider).useQuickAdjust) ? Color.fromARGB(255, 22, 22, 22) : Color.fromARGB(255, 173, 173, 173),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: (ref.watch(settingsNotifierProvider).useQuickAdjust) ? Color.fromARGB(255, 179, 206, 235) : Color.fromARGB(80, 185, 185, 185),
                      ),
                      onPressed: () {
                        if (ref.read(settingsNotifierProvider).useQuickAdjust){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AdjustIncrementForm();
                            });
                        }
                        else {
                          null;
                        }
                      }, 
                      child: Text(
                        ref.watch(settingsNotifierProvider).adjustAmount.toString(),
                        style: TextStyle(
                          color: (ref.watch(settingsNotifierProvider).useQuickAdjust) ? Color.fromARGB(255, 40, 40, 40) : Color.fromARGB(80, 139, 139, 139),
                        ),
                        )
                    ),
                  )
                ],
              ),
              // TextFormField(
              //     controller: amountController,
              //     decoration: const InputDecoration(
              //       labelText: "Amount",
              //       icon: Icon(Icons.numbers),
              //       hintText: "1",
              //     ),
              //     inputFormatters: [
              //       FilteringTextInputFormatter.digitsOnly,
              //       LengthLimitingTextInputFormatter(3),
              //     ],
              //     keyboardType: TextInputType.number,
              //   ),
            ],
          ),
        )
      )
    ); },);
  }
}