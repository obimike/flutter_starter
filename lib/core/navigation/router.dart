import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/core/app/pages/onboarding/onboarding.dart';
import 'package:flutter_starter/core/navigation/route.dart';
import 'package:flutter_starter/feature/auth/cubit/auth/cubit.dart';
import 'package:flutter_starter/feature/auth/cubit/verify_code/cubit.dart';
import 'package:flutter_starter/feature/auth/ui/page/auth_page.dart';
import 'package:flutter_starter/feature/auth/ui/page/number_verification.dart';
import 'package:flutter_starter/feature/passenger/home/ui/home.dart';
import 'package:flutter_starter/feature/passenger/home/ui/widgets/navigation_menu.dart';
import 'package:flutter_starter/feature/passenger/settings/ui/settings.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    GoRoute(
      path: AppRoute.onBoardingPage.path,
      builder: (BuildContext context, GoRouterState state) =>
          const OnBoardingPage(),
    ),

    GoRoute(
      path: AppRoute.auth.path,
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => AuthCubit(),
          child: const AuthPage(),
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: AppRoute.numberVerification.path,
          name: AppRoute.numberVerification.path,
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider(
                create: (context) => VerifyCodeCubit(),
                child: NumberVerification(
                  phoneNumber: state.pathParameters['phoneNumber'],
                ));
          },
        ),
      ],
    ),

    GoRoute(
      path: AppRoute.navigationMenu.path,
      builder: (BuildContext context, GoRouterState state) {
        return const NavigationMenu();
      },
      routes: <RouteBase>[
        GoRoute(
            path: AppRoute.home.path,
            builder: (BuildContext context, GoRouterState state) {
              return const HomePage();
            }),
        GoRoute(
            path: AppRoute.settings.path,
            builder: (BuildContext context, GoRouterState state) {
              return const SettingsPage();
            }),
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
