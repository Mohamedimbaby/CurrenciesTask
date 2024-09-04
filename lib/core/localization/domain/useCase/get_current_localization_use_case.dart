import 'package:currencies_converter/core/localization/domain/repository/localization_repository.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class GetCurrentLocalizationUseCase {
  final LocalizationRepository repository;

  GetCurrentLocalizationUseCase(this.repository);

  String execute() {
    return  repository.getCurrentLocalization();
  }
}
