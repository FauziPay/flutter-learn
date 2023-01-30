import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc_with_bloc.dart';

class CounterScreenBloc extends StatefulWidget {
  const CounterScreenBloc({super.key, required this.title});

  final String title;

  @override
  State<CounterScreenBloc> createState() => _CounterNonBlocState();
}

class _CounterNonBlocState extends State<CounterScreenBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: BlocProvider(
          create: (context) => CounterBlocWithBloc(),
          child: BlocBuilder<CounterBlocWithBloc, int>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$state',
                    style: const TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.read<CounterBlocWithBloc>().add(
                                CounterEvent.increment,
                              );
                        },
                        child: const Text("Increment"),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<CounterBlocWithBloc>().add(
                                CounterEvent.decrement,
                              );
                        },
                        child: const Text("Decrement"),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
