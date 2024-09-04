import 'package:currencies_converter/features/currenciesListing/data/model/currency_model.dart';
import 'package:equatable/equatable.dart';



abstract class CurrenciesState extends Equatable {
  @override
  List<Object> get props => [];
}

class CurrenciesInitial extends CurrenciesState {}
class CurrenciesError extends CurrenciesState {
  final String error ;
  CurrenciesError(this.error);
}

class CurrenciesLoaded extends CurrenciesState {
  final List<CurrencyData> currencies;
  final num favoriteCurrencyPrice;


  CurrenciesLoaded( {
    required this.currencies,
    required this.favoriteCurrencyPrice,
  });


  CurrenciesLoaded copyWith({List<CurrencyData>? newCurrencies,num? price}) {
    return CurrenciesLoaded(
      currencies: newCurrencies ?? currencies, favoriteCurrencyPrice: price ?? favoriteCurrencyPrice,
    );
  }

  @override
  List<Object> get props => [currencies,favoriteCurrencyPrice];
}
