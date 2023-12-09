import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState());

  void nextScreen() async {
    emit(state.copyWith(status: SplashStatus.loading));

    // During the Loading state we can do additional checks like,
    // if the internet connection is available or not etc..

    await Future.delayed(const Duration(
        seconds: 3)); // This is to simulate that above checking process
    emit(state.copyWith(status: SplashStatus.loaded));
  }
}
