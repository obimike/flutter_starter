import 'package:equatable/equatable.dart';

abstract class BlocEvent extends Equatable {
  const BlocEvent();
  @override
  List<Object?> get props => [];
}

class ContinueButtonPressedEvent extends BlocEvent {
  const ContinueButtonPressedEvent();
}

class PhoneNumberChangedEvent extends BlocEvent {
  const PhoneNumberChangedEvent(
      {required this.phone,
      required this.countryCode,
      required this.countryISOCode});
  final String phone;
  final String countryISOCode;
  final String countryCode;
  @override
  List<Object> get props => [phone, countryCode, countryISOCode];
}
