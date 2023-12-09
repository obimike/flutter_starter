import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<BlocEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<ContinueButtonPressedEvent>(_handleAuth);
    on<PhoneNumberChangedEvent>(_handlePhoneNumberChangedEvent);
  }

  Future<void> _handlePhoneNumberChangedEvent(
    PhoneNumberChangedEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(phone: event.phone));
  }

  Future<void> _handleAuth(
    ContinueButtonPressedEvent event,
    Emitter<AuthState> emit,
  ) async {
    bool isFieldNotEmpty = state.phone.isNotEmpty;

    if (isFieldNotEmpty) {
      // check if it is a number
      // emit(state.copyWith(status: AuthStatus.loading));
      print(
          "--------------------------state.phone------------------------------");
      print(state.phone);

      // Timer(
      //   const Duration(seconds: 5),
      //       (){ emit(state.copyWith(status: AuthStatus.newUserSuccess));},
      // );

      emit(state.copyWith(status: AuthStatus.newUserSuccess));
    } else {
      emit(state.copyWith(
          message: 'Phone number is required!', status: AuthStatus.failure));
      print(state.message);
    }
  }
}
