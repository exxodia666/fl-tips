part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class AuthorisationEvent extends AuthEvent {
  final String password;
  final String email;

  const AuthorisationEvent({required this.email, required this.password});

  @override
  List<Object> get props => [];
}

class SignOutEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}