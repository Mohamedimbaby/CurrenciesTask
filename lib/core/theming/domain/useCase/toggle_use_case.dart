
import 'package:currencies_converter/core/theming/domain/entity/app_theme.dart';
import 'package:currencies_converter/core/theming/domain/repository/theme_repository.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class ToggleUseCase {
  final ThemeRepository repository;

  ToggleUseCase(this.repository);

  Future<void> execute(bool isDarkMode) async{
     await repository.setTheme(isDarkMode);
  }
}
