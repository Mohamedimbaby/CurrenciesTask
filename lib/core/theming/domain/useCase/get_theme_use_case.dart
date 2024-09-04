
import 'package:currencies_converter/core/theming/domain/entity/app_theme.dart';
import 'package:currencies_converter/core/theming/domain/repository/theme_repository.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class GetThemeUseCase {
  final ThemeRepository repository;

  GetThemeUseCase(this.repository);

  Future<AppTheme> execute() {
    return repository.getTheme();
  }
}
