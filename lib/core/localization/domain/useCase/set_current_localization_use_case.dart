import 'package:currencies_converter/core/localization/domain/repository/localization_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SetCurrentLocalizationUseCase {
  final LocalizationRepository repository;

  SetCurrentLocalizationUseCase(this.repository);

  Future<void> execute(String currentLocal) async {
    return await repository.setCurrentLocalization(currentLocal);
  }
}
