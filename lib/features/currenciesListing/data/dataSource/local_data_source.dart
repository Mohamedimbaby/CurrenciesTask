import 'package:currencies_converter/core/localStorage/flags/flags_reader.dart';
import 'package:currencies_converter/features/currenciesListing/data/dataSource/data_source.dart';
import 'package:currencies_converter/features/currenciesListing/data/model/currency_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: DataSource)
class LocalDataSource extends DataSource {
  FlagsJsonReader reader;

  LocalDataSource(this.reader);

  @override
  Future<List<CurrencyRemoteModel>> loadCountriesData() async {
    Map<String, dynamic> map = await reader.loadJsonData();
    return CountryFlags.fromJson(map).countries;
  }
}
