import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ParsingJsonScreen extends StatelessWidget {
  const ParsingJsonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fundamental Parsing Json"),
        centerTitle: true,
      ),
      body: const ParsingJsonScreenBody(),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: const Text("Read JSON Data"),
          ),
          const SizedBox(
            height: 12.0,
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "no data",
              style: TextStyle(
                fontSize: 22.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
