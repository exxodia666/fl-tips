import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/authorisation.dart';

part 'auth_events.dart';
part 'auth_state.dart';

class AuthorisationBloc extends Bloc<AuthEvent, AuthorisationState> {
  final AuthorisationRepository _authorisationRepository;

  AuthorisationBloc(this._authorisationRepository) : super(AuthorisationInit()) {
    on<AuthorisationEvent>((event, emit) async {
      emit(AuthorisationLoading());
      try {
        final result = await _authorisationRepository.login(event.email, event.password);
        if (kDebugMode) {
          print(result);
        }
        emit(AuthorisationSuccess());
      } catch (e) {
        emit(AuthorisationError(e.toString()));
      }
    });
    on<SignOutEvent>((event, emit) async {
      try {
        await _authorisationRepository.signOut();
      } catch(e) {
        emit(AuthorisationError(e.toString()));
      }
    });
  }
}