import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/core/app/pages/onboarding/onboarding.dart';
import 'package:flutter_starter/core/app/pages/splash/splash_cubit/cubit.dart';
import 'package:flutter_starter/core/app/pages/splash/splash_cubit/state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<SplashCubit, SplashState>(
          builder: (context, state) {
            if (state.status == SplashStatus.loaded) {
              return const OnBoardingPage();
            }
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image(image: AssetImage("assets/images/logo.png"))],
            );
          },
        ),
      ),
    );
  }
}
