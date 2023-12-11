import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/core/util/helpers/validators.dart';

import 'state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  void numberChanged(
    String phone,
    String countryCode,
    String countryISOCode,
  ) {
    emit(state.copyWith(
        phone: phone,
        countryCode: countryCode,
        countryISOCode: countryISOCode));
  }

  void countryChanged(String value) {
    emit(state.copyWith(
      country: value,
    ));
  }


  Future<void> buttonClicked() async {
    emit(state.copyWith(status: AuthStatus.loading));

    bool isFieldNotEmpty = state.phone.isNotEmpty;

    if (isFieldNotEmpty) {
      // check if it is a number
      bool isPhoneNumberValid = Validators.isNumber(state.phone);
      if (isPhoneNumberValid) {
        emit(state.copyWith(status: AuthStatus.loading));

        await Future.delayed(const Duration(seconds: 3));

        emit(state.copyWith(status: AuthStatus.success));
      } else {
        emit(state.copyWith(
            message: 'Please enter a valid phone number!',
            status: AuthStatus.failure));
      }
    } else {
      emit(state.copyWith(
          message: 'Phone number is required!', status: AuthStatus.failure));
    }
  }
}
