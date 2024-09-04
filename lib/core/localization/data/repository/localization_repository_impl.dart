import 'package:currencies_converter/core/localization/domain/repository/localization_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
@LazySingleton(as: LocalizationRepository)
class ThemeRepositoryImpl implements LocalizationRepository {
  final SharedPreferences sharedPreferences;

  ThemeRepositoryImpl(this.sharedPreferences);

  @override
  String getCurrentLocalization()  {
    return sharedPreferences.getString('locale') ?? "en";
  }

  @override
  Future<void> setCurrentLocalization(String currentLocal) async{
    await sharedPreferences.setString('locale',currentLocal);
  }
}
