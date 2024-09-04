import 'package:currencies_converter/features/currenciesListing/data/model/currency_model.dart';

abstract class CurrenciesRepository {
  Future<List<CurrencyData>> getCurrencies();
}