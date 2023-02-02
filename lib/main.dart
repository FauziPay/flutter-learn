import 'package:flutter/material.dart';
import 'package:flutter_learn_parse/screen/latihan_screen_api/home_page_users.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: HomePageApiScreen(),
      ),
    );
  }
}
