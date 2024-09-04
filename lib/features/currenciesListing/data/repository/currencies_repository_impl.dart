import 'dart:typed_data';

import 'package:currencies_converter/core/extensions/extension.dart';
import 'package:currencies_converter/core/localStorage/currencies/currency_local_storage.dart';
import 'package:currencies_converter/features/currenciesListing/data/dataSource/data_source.dart';
import 'package:currencies_converter/features/currenciesListing/data/model/currency_model.dart';
import 'package:currencies_converter/features/currenciesListing/data/services/currencies_services.dart';
import 'package:currencies_converter/features/currenciesListing/data/services/flags_service.dart';
import 'package:currencies_converter/features/currenciesListing/domain/repository/currencies_repository.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
@LazySingleton(as: CurrenciesRepository)
class CurrenciesRepositoryImpl extends CurrenciesRepository{
  CurrenciesService currenciesService ;
  FlagsService flagsService ;
  DataSource localDataSource ;
  CurrencyLocalStorage currencyLocalStorage;
  
  CurrenciesRepositoryImpl({
    required this.currenciesService,
    required this.flagsService,
    required this.currencyLocalStorage,
    required this.localDataSource,
  });

  @override
  Future<List<CurrencyData>> getCurrencies() async{
    List<Map<String,dynamic>> list = await currencyLocalStorage.fetchCurrencies();
    if (list.isNotEmpty){
      return list.map<CurrencyData>((item){
        Uint8List imageBytes = item["flag"] ;
        CurrencyData model = CurrencyLocalModel( imageBytes,code: item["code"], country: item['country'],);
        model.currency = item["currency"];
        model.price = item["price"];
        return model;
      }).toList();
    }else{
    List<CurrencyRemoteModel> countriesData =await localDataSource.loadCountriesData();

    Map<String,dynamic> response = await currenciesService.getCurrencies(DateTime.now().twoDaysBeforeToday());
    for(var currency in response.keys){
      for(CurrencyRemoteModel item in countriesData){
        if(item.currency ==
            currency.trim()){
          item.price = response[currency]["value"] ?? 0;
        }
      }
    }
    countriesData.removeWhere((item)=> item.price==null);
    saveCurrenciesData(countriesData);
    return countriesData;
  }
  }

  void saveCurrenciesData(List<CurrencyRemoteModel> remoteData) async{
    for (CurrencyRemoteModel item in remoteData) {
      var uint8list = await flagsService.getFlag(item.flag);
      await currencyLocalStorage.insertCurrency(item,uint8list!);
    }
  }

}