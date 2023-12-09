import 'package:equatable/equatable.dart';

enum AuthStatus {
  newUserSuccess,
  existingUserSuccess,
  failure,
  loading,
  initial,
}

class AuthState extends Equatable {
  const AuthState({
    this.phone = '',
    this.countryCode = '',
    this.countryISOCode = '',
    this.message = '',
    this.status = AuthStatus.initial,
  });

  final String phone;
  final String countryCode;
  final String countryISOCode;
  final String message;
  final AuthStatus status;

  AuthState copyWith({
    String? phone,
    String? countryCode,
    String? countryISOCode,
    AuthStatus? status,
    String? message,
  }) {
    return AuthState(
      phone: phone ?? this.phone,
      countryCode: countryCode ?? this.countryCode,
      countryISOCode: countryISOCode ?? this.countryISOCode,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [phone,countryCode, countryISOCode, message, status];
}
