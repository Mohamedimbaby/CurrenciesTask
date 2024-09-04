import 'package:currencies_converter/features/currenciesListing/data/model/currency_model.dart';

abstract class GetCurrenciesUseCase {
  Future<List<CurrencyData>> execute();
}