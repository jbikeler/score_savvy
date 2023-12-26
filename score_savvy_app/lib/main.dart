import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:score_savvy_app/locator.dart';
import 'package:score_savvy_app/screen/home_screen.dart';
import 'package:score_savvy_app/screen/settings_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setup(); //sets up the get in singletons. currently used for accessing the database

  runApp(
    const ProviderScope( //ProviderScope wraps root widget so we can access Riverpod
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
      initialRoute: "/",
      routes: {
        '/':(context) => HomePage(),
        '/settings':(context) => SettingsScreen()
      },
    );
  }
}
