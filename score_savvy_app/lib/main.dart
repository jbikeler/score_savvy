import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:score_savvy_app/data/database.dart';
import 'package:score_savvy_app/screen/home_screen.dart';

void main() {

  runApp(
    const ProviderScope(
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Score Savvy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const 
        Color.fromARGB(255, 93, 143, 235)),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
