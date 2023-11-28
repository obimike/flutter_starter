import 'package:equatable/equatable.dart';

enum SplashStatus { initial, loading, loaded }

class Splash_blocState extends Equatable {
  const Splash_blocState({
    this.status = SplashStatus.initial,
});

  final SplashStatus status;

  Splash_blocState copyWith({
    SplashStatus? status,
  }) {
    return Splash_blocState(
      status: status ?? this.status,
    );
  }
    @override
    List<Object> get props => [status];
}


