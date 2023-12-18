import 'package:equatable/equatable.dart';

enum ThemeModeOptions { light, dark }

class ThemeState  extends Equatable  {
  const ThemeState(this.mode);

  final ThemeModeOptions mode;

  @override
  List<Object?> get props => [mode];
}
