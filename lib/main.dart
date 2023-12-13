import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_starter/core/app/app.dart';
import 'package:flutter_starter/core/util/constants/colors.dart';
import 'package:loggy/loggy.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  _initLoggy();
  // TODO: initialize local storage
  // TODO: check authentication storage
  Bloc.observer = const AppBlocObserver();
  await Future.delayed(const Duration(seconds: 3));
  FlutterNativeSplash.remove();
  runApp(const MyApp());
  _configLoading();
}

void _configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = ThemeMode.dark == "dark"? EasyLoadingStyle.light : EasyLoadingStyle.dark
    ..indicatorSize = 60
    ..radius = 8
    ..progressColor = MyColors.primary
    ..backgroundColor = MyColors.darkBackground
    ..indicatorColor = MyColors.secondary
    ..textColor = Colors.yellow
    ..maskColor = MyColors.darkBackground.withOpacity(0.75)
    ..userInteractions = false
    ..dismissOnTap = false;
}

void _initLoggy() {
  Loggy.initLoggy(
    logOptions: const LogOptions(
      LogLevel.all,
      stackTraceLevel: LogLevel.warning,
    ),
    logPrinter: const PrettyPrinter(
      showColors: true,
    ),
  );
}

class AppBlocObserver extends BlocObserver {
  /// {@macro app_bloc_observer}
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) print(change);
  }

  @override
  void onTransition(
      Bloc<dynamic, dynamic> bloc,
      Transition<dynamic, dynamic> transition,
      ) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}