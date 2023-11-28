import 'package:bloc/bloc.dart';

import 'event.dart';
import 'state.dart';

class BlocBloc extends Bloc<BlocEvent, BlocState> {
  BlocBloc() : super(BlocState().init());

  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async* {
    if (event is InitEvent) {
      yield await init();
    }
  }

  Future<BlocState> init() async {
    return state.clone();
  }
}
