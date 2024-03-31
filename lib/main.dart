import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_app/src/view/pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'Dice App',
      theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.white,
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
          inputDecorationTheme: const InputDecorationTheme(
            floatingLabelStyle: TextStyle(
              color: Colors.white70,
            ),
          )),
      home: const HomePage(),
    );
  }
}
