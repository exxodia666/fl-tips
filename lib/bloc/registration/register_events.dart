part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class RegistrationEvent extends RegisterEvent {
  final String password;
  final String email;

  const RegistrationEvent(this.email, this.password);

  @override
  List<Object> get props => [];
}