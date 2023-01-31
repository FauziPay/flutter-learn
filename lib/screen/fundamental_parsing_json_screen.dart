import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ParsingJsonScreenBody(),
    );
  }
}

class ParsingJsonScreenBody extends StatefulWidget {
  const ParsingJsonScreenBody({super.key});

  @override
  State<ParsingJsonScreenBody> createState() => _ParsingJsonScreenBodyState();
}

class _ParsingJsonScreenBodyState extends State<ParsingJsonScreenBody> {
  // fake method for simulation
  Future _loadJsonSample() async {
    String jsonString = await rootBundle.loadString('assets/sample.json');

    final jsonData = jsonDecode(jsonString);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: const Text("Read JSON Data"),
          ),
          const SizedBox(
            height: 12.0,
          ),
        ],
      ),
    );
  }
}
