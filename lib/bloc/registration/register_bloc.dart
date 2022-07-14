import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/registration.dart';

part 'register_events.dart';
part 'register_state.dart';

class RegistrationBloc extends Bloc<RegisterEvent, RegistrationState> {
  final RegistrationRepository _registrationRepository;

  RegistrationBloc(this._registrationRepository) : super(RegistrationInit()) {
    on<RegistrationEvent>((event, emit) async {
      emit(RegistrationLoading());
      try {
        final result =
            await _registrationRepository.register(event.email, event.password);
        if (kDebugMode) {
          print(result);
        }
        emit(RegistrationSuccess());
      } catch (e) {
        emit(RegistrationError(e.toString()));
      }
    });
  }
}
