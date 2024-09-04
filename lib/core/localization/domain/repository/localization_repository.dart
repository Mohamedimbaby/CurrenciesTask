
abstract class LocalizationRepository {
  String getCurrentLocalization();
  Future<void> setCurrentLocalization(String currentLocal);
}
