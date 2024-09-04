import 'package:currencies_converter/features/currenciesListing/data/model/currency_model.dart';
import 'package:currencies_converter/features/currenciesListing/domain/repository/currencies_repository.dart';
import 'package:currencies_converter/features/currenciesListing/domain/useCase/get_currencies_use_case.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as: GetCurrenciesUseCase)
class GetCurrenciesUseCaseImpl extends GetCurrenciesUseCase{
  CurrenciesRepository currenciesRepository ;

  GetCurrenciesUseCaseImpl(this.currenciesRepository);

  @override
  Future<List<CurrencyData>> execute() async{
    return await currenciesRepository.getCurrencies();
  }

}