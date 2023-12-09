import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  splash('/'),
  onBoardingPage('/intro'),
  home('/home'),
  numberVerification('number_verification'),
  settings('/settings'),
  auth('/auth'),
  ;

  const AppRoute(this.path);

  final String path;
}

extension AppRouteNavigation on AppRoute {
  void go(BuildContext context) => context.go(path);

  void push(BuildContext context) => context.push(path);

  void pushReplacement(BuildContext context) => context.pushReplacement(path);
}