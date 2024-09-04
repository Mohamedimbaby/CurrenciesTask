import 'package:currencies_converter/features/currenciesListing/data/model/currency_model.dart';
import 'package:currencies_converter/features/currenciesListing/domain/repository/currencies_repository.dart';
import 'package:currencies_converter/features/currenciesListing/domain/useCase/get_currencies_use_case.dart';
import 'package:currencies_converter/features/currenciesListing/domain/useCase/get_currencies_use_case_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';






void main() async {

  late GetCurrenciesUseCase getCurrenciesUseCase;
  late CurrenciesRepository currenciesRepository;
  CurrencyData fakeData =  CurrencyData("eg","egypt",price: 1,currency: "EGP");

  setUp(() {
    currenciesRepository = MockCurrenciesRepository();
    getCurrenciesUseCase = GetCurrenciesUseCaseImpl(currenciesRepository);
  });
  test('test getting currencies use case ', () async {
    //arrange
    when(() => currenciesRepository.getCurrencies()).thenAnswer((invocation) => Future.value([fakeData]));
    //act
    List<CurrencyData> result = await getCurrenciesUseCase.execute();

    //assert
    verify(
      () => currenciesRepository.getCurrencies(),).called(1);
    assert(result.length==1);
    expect(result.first, fakeData);
  });
  test('test throwing an error while getting currencies ', () async {
    //arrange
    when(() => currenciesRepository.getCurrencies()).thenThrow(DioException(requestOptions: RequestOptions()));
    //assert
    expect(()async => await getCurrenciesUseCase.execute(), throwsA(isA<DioException>()));
    verify(() => currenciesRepository.getCurrencies(),).called(1);

  });

}
