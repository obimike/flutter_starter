import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';
import 'state.dart';

class Splash_blocBloc extends Bloc<Splash_blocEvent, Splash_blocState> {
  Splash_blocBloc() : super(const Splash_blocState()) {
    on<NavigateToNextScreenEvent>((event, emit) async {
      emit(state.copyWith(status: SplashStatus.loading));

      // During the Loading state we can do additional checks like,
      // if the internet connection is available or not etc..

      await Future.delayed(const Duration(
          seconds: 3)); // This is to simulate that above checking process
      emit(state.copyWith(status: SplashStatus.loaded));
    });
  }
}
