import 'package:currencies_converter/core/theming/domain/useCase/toggle_use_case.dart';
import 'package:currencies_converter/core/theming/presentation/theme_bloc/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:currencies_converter/core/theming/domain/useCase/get_theme_use_case.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'theme_event.dart';
@injectable
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final GetThemeUseCase getThemeUseCase;
  final ToggleUseCase toggleThemeUseCase;

  ThemeBloc(this.getThemeUseCase,this.toggleThemeUseCase,) : super(ThemeInitial()) {

    on<LoadThemeEvent>(_onLoadTheme);
    on<ToggleThemeEvent>(_onToggleTheme);
  }

  Future<void> _onLoadTheme(LoadThemeEvent event, Emitter<ThemeState> emit) async {
    final appTheme = await getThemeUseCase.execute();
    emit(ThemeLoaded(lightTheme: appTheme.lightTheme, darkTheme: appTheme.darkTheme,themeMode: appTheme.themeMode));
  }

  void _onToggleTheme(ToggleThemeEvent event, Emitter<ThemeState> emit) async{
    if (state is ThemeLoaded) {
      final currentTheme = (state as ThemeLoaded).themeMode;
      final newTheme = currentTheme == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
      await toggleThemeUseCase.execute(newTheme==ThemeMode.dark);
      emit((state as ThemeLoaded).copyWith(themeMode: newTheme));
    }
  }
}
