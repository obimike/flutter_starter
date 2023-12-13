import 'package:equatable/equatable.dart';

enum AuthStatus {
  success,
  failure,
  loading,
  initial,
}

class AuthState extends Equatable {
  const AuthState({
    this.phone = '',
    this.country = 'Nigeria',
    this.countryCode = '',
    this.countryISOCode = '',
    this.message = '',
    this.status = AuthStatus.initial,
  });

  final String phone;
  final String country;
  final String countryCode;
  final String countryISOCode;
  final String message;
  final AuthStatus status;

  AuthState copyWith({
    String? phone,
    String? country,
    String? countryCode,
    String? countryISOCode,
    AuthStatus? status,
    String? message,
  }) {
    return AuthState(
      phone: phone ?? this.phone,
      country: country ?? this.country,
      countryCode: countryCode ?? this.countryCode,
      countryISOCode: countryISOCode ?? this.countryISOCode,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [phone, country, countryCode, countryISOCode, message, status];
}
