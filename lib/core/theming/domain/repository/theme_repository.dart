import 'package:currencies_converter/core/theming/domain/entity/app_theme.dart';

abstract class ThemeRepository {
  Future<AppTheme> getTheme();
  Future<void> setTheme(bool isDarkMode);
}
