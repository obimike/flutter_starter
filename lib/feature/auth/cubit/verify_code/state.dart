import 'package:equatable/equatable.dart';

enum VerifyCodeStatus {
  success,
  failure,
  loading,
  initial,
}

class VerifyCodeState extends Equatable {
  const VerifyCodeState({
    this.code = '',
    this.message = '',
    this.status = VerifyCodeStatus.initial,
  });

  final String code;
  final String message;
  final VerifyCodeStatus status;

  VerifyCodeState copyWith({
    String? code,
    VerifyCodeStatus? status,
    String? message,
  }) {
    return VerifyCodeState(
      code: code ?? this.code,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [code, message, status];
}
