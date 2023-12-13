import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';

class VerifyCodeCubit extends Cubit<VerifyCodeState> {
  VerifyCodeCubit() : super(const VerifyCodeState());

  void codeChanged(String value) {
    emit(state.copyWith(
      code: value,
    ));
  }

  Future<void> codeComplete() async {
    emit(state.copyWith(status: VerifyCodeStatus.loading));

    final code = state.code;

    print("******************$code******************************");

    emit(state.copyWith(status: VerifyCodeStatus.loading));
    await Future.delayed(const Duration(seconds: 5));

    if (code == "1234") {
      emit(state.copyWith(status: VerifyCodeStatus.success));
    } else {
      emit(state.copyWith(
          message: 'Invalid code!', status: VerifyCodeStatus.failure));
    }
  }
}
