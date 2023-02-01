import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<OnAuthEventCalled>((event, emit) async {
      emit(AuthLoading());
      await Future.delayed(
        const Duration(seconds: 3),
      );
      emit(
        AuthSuccess(username: event.username),
      );
    });
  }
}
