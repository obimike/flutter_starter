import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  onBoardingPage('/'),
  navigationMenu('/passenger'),
  home('home'),
  settings('settings'),
  auth('/auth'),
  numberVerification('number_verification/:phoneNumber'),
  ;

  const AppRoute(this.path);

  final String path;
}

extension AppRouteNavigation on AppRoute {
  void go(BuildContext context) => context.go(path);

  void push(BuildContext context) => context.push(path);

  void pushReplacement(BuildContext context) => context.pushReplacement(path);
}