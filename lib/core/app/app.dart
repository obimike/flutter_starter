import 'package:flutter/material.dart';
import 'package:flutter_starter/core/app/di.dart';
import 'package:flutter_starter/core/app/style.dart';
import 'package:flutter_starter/core/navigation/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return DI(
      child: MaterialApp.router(
        title: 'Flutter Starter',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        routerConfig: router,
      ),
    );
  }
}