part of 'register_bloc.dart';

@immutable
abstract class RegistrationState extends Equatable {}

class RegistrationInit extends RegistrationState {
  @override
  List<Object?> get props => [];
}

class RegistrationLoading extends RegistrationState {
  @override
  List<Object?> get props => [];
}

class RegistrationSuccess extends RegistrationState {
  @override
  List<Object?> get props => [];
}

class RegistrationError extends RegistrationState {
  final String error;

  RegistrationError(this.error);

  @override
  List<Object?> get props => [error];
}
