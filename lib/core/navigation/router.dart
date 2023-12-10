import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/core/app/pages/onboarding/onboarding.dart';
import 'package:flutter_starter/core/app/pages/splash/splash_cubit/cubit.dart';
import 'package:flutter_starter/core/app/pages/splash/splash_page.dart';
import 'package:flutter_starter/core/navigation/route.dart';
import 'package:flutter_starter/feature/auth/bloc/auth/auth_bloc.dart';
import 'package:flutter_starter/feature/auth/ui/page/auth_page.dart';
import 'package:flutter_starter/feature/auth/ui/page/number_verification.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/intro',
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    GoRoute(
      path: AppRoute.splash.path,
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) =>
              SplashCubit()..nextScreen(),
          child: const SplashPage(),
        );
      },
    ),

    GoRoute(
      path: AppRoute.onBoardingPage.path,
      builder: (BuildContext context, GoRouterState state) =>
          const OnBoardingPage(),
    ),

    GoRoute(
      path: AppRoute.auth.path,
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => AuthBloc(),
          child: const AuthPage(),
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: AppRoute.numberVerification.path,
          name: AppRoute.numberVerification.path,
          builder: (BuildContext context, GoRouterState state) {
            return const NumberVerification();
          },
        ),
      ],
    ),

    // GoRoute(
    //   path: AppRoute.auth.path,
    //   builder: (context, state) {
    //     return BlocProvider(
    //       create: (context) => AuthCubit(
    //         userRepository: context.read<UserRepository>(),
    //         authRepository: context.read<AuthRepository>(),
    //       ),
    //       child: const AuthPage(),
    //     );
    //   },
    // ),
  ],
  redirect: (BuildContext context, GoRouterState state) {
    //   check if the user is logged in
  },
);
