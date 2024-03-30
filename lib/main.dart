import 'package:flutter/material.dart';
import 'package:movies_app/src/view/pages/movies_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice App',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.white,
        brightness: Brightness.dark,
        fontFamily: 'Poppins',
      ),
      home: const MoviesPage(),
    );
  }
}
