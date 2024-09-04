import 'dart:typed_data';

import 'package:currencies_converter/core/extensions/extension.dart';
import 'package:currencies_converter/core/localStorage/currencies/currency_local_storage.dart';
import 'package:currencies_converter/features/currenciesListing/data/dataSource/data_source.dart';
import 'package:currencies_converter/features/currenciesListing/data/model/currency_model.dart';
import 'package:currencies_converter/features/currenciesListing/data/repository/currencies_repository_impl.dart';
import 'package:currencies_converter/features/currenciesListing/data/services/currencies_services.dart';
import 'package:currencies_converter/features/currenciesListing/data/services/flags_service.dart';
import 'package:currencies_converter/features/currenciesListing/domain/repository/currencies_repository.dart';
import 'package:currencies_converter/features/currenciesListing/domain/useCase/get_currencies_use_case.dart';
import 'package:currencies_converter/features/currenciesListing/domain/useCase/get_currencies_use_case_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../mocks.dart';

void main() async {

  late CurrenciesRepository currenciesRepository;
  late DataSource mockDataSource;
  late CurrencyLocalStorage mockCurrencyLocalStorage;
  late CurrenciesService mockCurrenciesService;
  late FlagsService mockFlagsService;
  Uint8List fakeImageBytes =  Uint8List(20);
  CurrencyLocalModel fakeData =  CurrencyLocalModel(fakeImageBytes, code: "eg", country: 'egypt');
  CurrencyRemoteModel remoteFakeData =  CurrencyRemoteModel("en.svg", code: "eg", country: 'egypt',)..currency="egp"..price=1;

  setUp(() {
    mockDataSource= MockLocalDataSource();
    mockCurrencyLocalStorage= MockCurrencyLocalStorage();
    mockCurrenciesService= MockCurrenciesService();
    mockFlagsService= MockFlagService();
    currenciesRepository = CurrenciesRepositoryImpl(localDataSource: mockDataSource, currenciesService: mockCurrenciesService, flagsService: mockFlagsService, currencyLocalStorage: mockCurrencyLocalStorage);
  });
  test('test getting currencies offline ', () async {
    Map<String,dynamic> jsonData = fakeData.toJson();
    jsonData["flag"]=fakeData.flag;
    //arrange
    when(() => mockCurrencyLocalStorage.fetchCurrencies()).thenAnswer((invocation) =>
        Future.value([jsonData]));
    //act
    List<CurrencyData> result = await currenciesRepository.getCurrencies();

    //assert
    verify(() => mockCurrencyLocalStorage.fetchCurrencies(),).called(1);
    assert(result.length==1);
    expect(result.first.country, fakeData.country);
  });
  test('test getting currencies online ', () async {
  Map<String,dynamic> map ={
  "data": {
         "EGP": {
         "code": "EGP",
         "value": 0.0594492643
         }
  }};
   //arrange
    when(() => mockCurrencyLocalStorage.fetchCurrencies()).thenAnswer((invocation) =>
        Future.value([]));
    when(() => mockDataSource.loadCountriesData()).thenAnswer((invocation) =>
        Future.value([remoteFakeData]));
    when(() => mockCurrenciesService.getCurrencies(DateTime.now().twoDaysBeforeToday())).thenAnswer((invocation) =>
        Future.value(map));
    when(() => mockFlagsService.getFlag(remoteFakeData.flag)).thenAnswer((invocation) =>
        Future.value(fakeImageBytes));
    when(() => mockCurrencyLocalStorage.insertCurrency(remoteFakeData,fakeImageBytes)).thenAnswer((invocation) =>
        Future.value(1));
    //act
    List<CurrencyData> result = await currenciesRepository.getCurrencies();

    //assert
    verify(() => mockCurrencyLocalStorage.fetchCurrencies(),).called(1);
    verify(() => mockCurrenciesService.getCurrencies(DateTime.now().twoDaysBeforeToday(),)).called(1);
    verify(() => mockDataSource.loadCountriesData(),).called(1);
    verify(() => mockFlagsService.getFlag(remoteFakeData.flag),).called(1);
    Future.delayed(const Duration(seconds: 2),(){
      // this delay cause we did not await till all database insertion done to retrieve the remote data
      verify(() => mockCurrencyLocalStorage.insertCurrency(remoteFakeData,fakeImageBytes),).called(1);
    });
    assert(result.length == 1);
    expect(result.first, remoteFakeData);
  });

}
