import 'package:currencies_converter/features/currenciesListing/data/model/currency_model.dart';
import 'package:currencies_converter/features/currenciesListing/domain/useCase/get_currencies_use_case.dart';
import 'package:currencies_converter/features/currenciesListing/presentation/bloc/currencies_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'currencies_event.dart';

@injectable
class CurrenciesBloc extends Bloc<CurrenciesEvent, CurrenciesState> {
  final GetCurrenciesUseCase getCurrenciesUseCase;

  CurrenciesBloc(
      this.getCurrenciesUseCase,
      ) : super(CurrenciesInitial()) {

    on<LoadCurrenciesEvent>(_onGetCountries);
  }

  Future<void> _onGetCountries(
      LoadCurrenciesEvent event, Emitter<CurrenciesState> emit) async {
    try {
      final countries = await getCurrenciesUseCase.execute();
     emit(CurrenciesLoaded(currencies: countries, favoriteCurrencyPrice: countries.firstWhere((item)=> item.currency?.toLowerCase() == "usd",orElse: ()=> CurrencyRemoteModel("code", code: 'us', country: 'as')..price=1).price ?? 0));
    } catch (e) {
      emit(CurrenciesError(e.toString()));
    }
  }
}
