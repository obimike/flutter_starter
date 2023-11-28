import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/core/app/pages/splash_bloc/bloc.dart';
import 'package:flutter_starter/core/app/pages/splash_bloc/event.dart';

class DI extends StatelessWidget {
  const DI({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return _BlocDI(
      child: child,
    );
  }
}

class _RepositoryDI extends StatelessWidget {
  const _RepositoryDI({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: const [
        // RepositoryProvider<UserRepository>(
        //   create: (context) => UserRepository(
        //     userProvider: context.read<UserMockProvider>(),
        //   ),
        // ),
        // RepositoryProvider<AuthRepository>(
        //   create: (context) => AuthRepository(
        //     userProvider: context.read<UserMockProvider>(),
        //   ),
        // ),
      ],
      child: child,
    );
  }
}

class _BlocDI extends StatelessWidget {
  const _BlocDI({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider<UserCubit>(
        //   create: (context) => UserCubit(
        //     userRepository: context.read<UserRepository>(),
        //   ),
        // ),

        BlocProvider(
          create: (context) => Splash_blocBloc()..add(NavigateToNextScreenEvent()),
        ),
      ],
      child: child,
    );
  }
}
