// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class OnAuthEventCalled extends AuthEvent {
  final String username;
  final String password;

  OnAuthEventCalled({
    required this.username,
    required this.password,
  });
}
