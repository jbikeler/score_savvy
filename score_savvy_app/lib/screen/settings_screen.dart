import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          // children: [
          //   Center(child: Text("Settings")),
          //   CheckboxListTile(
          //     value: true,
          //     onChanged: (bool newValue){

          //     }
          //     ))
          // ],
        )
      ),
    );
  }
}