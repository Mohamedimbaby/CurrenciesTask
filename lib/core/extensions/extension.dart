import 'package:currencies_converter/features/currenciesListing/data/model/currency_model.dart';
import 'package:intl/intl.dart';

extension GetSpecificCurrency on List<CurrencyData>{
  CurrencyData getUSDCurrency(){
    return firstWhere((item)=> item.currency?.toLowerCase() == "usd");
  }
  CurrencyData getEURCurrency(){
    return firstWhere((item)=> item.currency?.toLowerCase() == "eur");
  }CurrencyData getEGPCurrency(){
    return firstWhere((item)=> item.currency?.toLowerCase() == "egp");
  }
}
extension GetDateTime on DateTime{
  String twoDaysBeforeToday(){
    String todayFormatted = DateFormat("yyyy-MM-dd").format(subtract(const Duration(days: 2)));
    return todayFormatted;
  }

}
