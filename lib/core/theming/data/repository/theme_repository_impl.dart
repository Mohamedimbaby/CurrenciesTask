import 'package:currencies_converter/core/theming/data/models/dark_theme_data_model.dart';
import 'package:currencies_converter/core/theming/data/models/light_theme_data_model.dart';
import 'package:currencies_converter/core/theming/domain/entity/app_theme.dart';
import 'package:currencies_converter/core/theming/domain/repository/theme_repository.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
@LazySingleton(as: ThemeRepository)
class ThemeRepositoryImpl implements ThemeRepository {
  final SharedPreferences sharedPreferences;

  ThemeRepositoryImpl(this.sharedPreferences);

  @override
  Future<AppTheme> getTheme() async {
    bool isDarkMode = sharedPreferences.getBool('isDarkMode') ?? false;

    return AppTheme(
      lightTheme: lightTheme,
      darkTheme: darkTheme,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
    );
  }

  @override
  Future<void> setTheme(bool isDarkMode) async{
    await sharedPreferences.setBool('isDarkMode',isDarkMode);
  }
}
