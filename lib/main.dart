import 'package:flutter/material.dart';
import 'package:flutter_learn_parse/screen/fundamental_parsing_json_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: ParsingJsonScreen(),
      ),
    );
  }
}
