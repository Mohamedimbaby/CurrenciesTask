import 'dart:typed_data';

import 'package:currencies_converter/core/localStorage/currencies/currency_local_storage.dart';
import 'package:currencies_converter/features/currenciesListing/data/model/currency_model.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

@LazySingleton(as: CurrencyLocalStorage)
class CurrencyDatabase extends CurrencyLocalStorage{
  final Database database ;
  CurrencyDatabase(this.database);
  

  @override
  Future<int> insertCurrency(CurrencyRemoteModel currency,Uint8List imageData) async {
    var json = currency.toJson();
    json["flag"]= imageData;
    return await database.insert('currencies', json);
  }

  @override
  Future<List<Map<String, dynamic>>> fetchCurrencies() async {
    return await database.query('currencies');
  }

  @override
  Future<int> clearCurrencies() async {
    return await database.delete('currencies');
  }
@override
  Future close() async {
  database.close();
  }
}
