import 'package:currencies_converter/features/currenciesListing/data/model/currency_model.dart';

abstract class DataSource{
  Future<List<CurrencyRemoteModel>> loadCountriesData();
}