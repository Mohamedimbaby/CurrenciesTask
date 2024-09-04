import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';



abstract class ThemeState extends Equatable {
  @override
  List<Object> get props => [];
}

class ThemeInitial extends ThemeState {}

class ThemeLoaded extends ThemeState {
  final ThemeData lightTheme;
  final ThemeData darkTheme;
  final ThemeMode themeMode;

  ThemeLoaded({
    required this.lightTheme,
    required this.darkTheme,
    this.themeMode = ThemeMode.light,
  });

  ThemeData get currentTheme => themeMode == ThemeMode.light ? lightTheme : darkTheme;

  ThemeLoaded copyWith({ThemeMode? themeMode}) {
    return ThemeLoaded(
      lightTheme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  List<Object> get props => [lightTheme, darkTheme, themeMode];
}
