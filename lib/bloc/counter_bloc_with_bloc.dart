import 'package:flutter_bloc/flutter_bloc.dart';

// abstract class CounterEvent {}

// class CounterIncrementEvent extends CounterEvent {}

// class CounterDecrementEvent extends CounterEvent {}

enum CounterEvent {
  increment,
  decrement,
}

class CounterBlocWithBloc extends Bloc<CounterEvent, int> {
  CounterBlocWithBloc() : super(0) {
    on<CounterEvent>((event, emit) {
      // if (event is CounterIncrementEvent) {
      if (event == CounterEvent.increment) {
        emit(state + 1);
      } else {
        if (state != 0) {
          emit(state - 1);
        }
      }
    });
  }
}
