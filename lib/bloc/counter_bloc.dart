// create Counter Event
import 'dart:async';

abstract class CounterEvent {}

class CounterIncrementEvent extends CounterEvent {}

class CounterDecrementEvent extends CounterEvent {}

class CounterBloc {
  // state and initialozation value
  int _value = 0;

  // create Event Stream Controller
  final StreamController<CounterEvent> _eventController =
      StreamController<CounterEvent>();

  StreamSink<CounterEvent> get eventSink => _eventController.sink;
  Stream<CounterEvent> get _eventStream => _eventController.stream;

  // create State Stream Controller
  final StreamController<int> _stateController = StreamController<int>();

  StreamSink<int> get _stateSink => _stateController.sink;
  Stream<int> get stateStream => _stateController.stream;
  // create Method MappingEventToState
  void _mappingEventToState(CounterEvent event) {
    if (event is CounterIncrementEvent) {
      _value++;
    } else {
      _value--;
    }

    _stateSink.add(_value);
  }

  CounterBloc() {
    _eventStream.listen(_mappingEventToState);
  }

  // create Method dispose for Stream Controller
  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}
