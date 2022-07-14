part of 'auth_bloc.dart';

@immutable
abstract class AuthorisationState extends Equatable {}

class AuthorisationInit extends AuthorisationState {
  @override
  List<Object?> get props => [];
}

class AuthorisationLoading extends AuthorisationState {
  @override
  List<Object?> get props => [];
}

class AuthorisationSuccess extends AuthorisationState {
  @override
  List<Object?> get props => [];
}

class AuthorisationError extends AuthorisationState {
  final String error;

  AuthorisationError(this.error);

  @override
  List<Object?> get props => [error];
}