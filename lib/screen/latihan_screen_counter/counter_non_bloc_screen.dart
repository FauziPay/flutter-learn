// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_learn_parse/bloc/counter_bloc_non_bloc.dart';

class CounterNonBloc extends StatefulWidget {
  const CounterNonBloc({super.key, required this.title});

  final String title;

  @override
  State<CounterNonBloc> createState() => _CounterNonBlocState();
}

class _CounterNonBlocState extends State<CounterNonBloc> {
  CounterBlocNonBloc bloc = CounterBlocNonBloc();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<int>(
                stream: bloc.stateStream,
                initialData: 0,
                builder: (context, snapshot) {
                  return Text(
                    '${snapshot.data}',
                    style: const TextStyle(
                      fontSize: 30.0,
                    ),
                  );
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    bloc.eventSink.add(CounterIncrementEvent());
                  },
                  child: const Text("Increment"),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    bloc.eventSink.add(CounterDecrementEvent());
                  },
                  child: const Text("Decrement"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
