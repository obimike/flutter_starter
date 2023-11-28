import 'package:flutter_starter/core/app/pages/onboarding.dart';
import 'package:flutter_starter/core/app/pages/splash_page.dart';
import 'package:flutter_starter/core/navigation/route.dart';
import 'package:go_router/go_router.dart';


final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: AppRoute.splash.path,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: AppRoute.onBoardingPage.path,
      builder: (context, state) => const OnBoardingPage(),
    ),
    // GoRoute(
    //   path: AppRoute.settings.path,
    //   builder: (context, state) => const SettingsPage(),
    // ),
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
);