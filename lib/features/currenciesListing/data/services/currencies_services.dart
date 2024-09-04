
import 'package:currencies_converter/core/networkProvider/network_provider.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CurrenciesService {
  NetworkProvider networkProvider;

  CurrenciesService({required this.networkProvider});

  Future<Map<String,dynamic>> getCurrencies(String dateTime) async {
    Response response =
        await networkProvider.get("historical?apikey=${networkProvider.apiKey}&currencies=&base_currency=EGP&date=$dateTime");
    return (response.data["data"] as Map<String,dynamic>);
  }
}
