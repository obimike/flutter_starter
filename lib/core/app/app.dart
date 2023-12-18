import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_starter/core/cubit/theme/cubit.dart';
import 'package:flutter_starter/core/navigation/router.dart';
import 'package:flutter_starter/core/util/theme/theme.dart';
import 'package:sizer/sizer.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeModeEnum>(
        builder: (context, themeMode) {
          return Sizer(builder: (context, orientation, deviceType) {
            return MaterialApp.router(
              title: 'Flutter Starter',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: themeMode == ThemeModeEnum.light
                  ? ThemeMode.light
                  : ThemeMode.dark,
              routerConfig: router,
              builder: EasyLoading.init(),
            );
          });
        },
      ),
    );
  }
}
