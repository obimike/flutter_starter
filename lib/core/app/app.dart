import 'package:flutter/material.dart';
// import 'package:flutter_starter/core/app/di.dart';
import 'package:flutter_starter/core/navigation/router.dart';
import 'package:flutter_starter/core/util/theme/theme.dart';
import 'package:sizer/sizer.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp.router(
        title: 'Flutter Starter',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        routerConfig: router,
      );
    });
  }
}
