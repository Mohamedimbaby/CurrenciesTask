import 'dart:typed_data';

import 'package:currencies_converter/features/currenciesListing/data/model/currency_model.dart';

abstract class CurrencyLocalStorage {

  Future<List<Map<String, dynamic>>> fetchCurrencies();
  Future<int> clearCurrencies();
  Future<int> insertCurrency(CurrencyRemoteModel currency, Uint8List imageData);
  Future close();
}