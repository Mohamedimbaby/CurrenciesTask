// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryFlags _$CountryFlagsFromJson(Map<String, dynamic> json) => CountryFlags(
      (json['countries'] as List<dynamic>)
          .map((e) => CurrencyRemoteModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CountryFlagsToJson(CountryFlags instance) =>
    <String, dynamic>{
      'countries': instance.countries,
    };

CurrencyData _$CurrencyDataFromJson(Map<String, dynamic> json) => CurrencyData(
      json['code'] as String,
      json['country'] as String,
      currency: json['currency'] as String?,
      price: json['price'] as num?,
    );

Map<String, dynamic> _$CurrencyDataToJson(CurrencyData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'country': instance.country,
      'currency': instance.currency,
      'price': instance.price,
    };

CurrencyRemoteModel _$CurrencyRemoteModelFromJson(Map<String, dynamic> json) =>
    CurrencyRemoteModel(
      json['flag'] as String,
      code: json['code'] as String,
      country: json['country'] as String,
    )
      ..currency = json['currency'] as String?
      ..price = json['price'] as num?;

Map<String, dynamic> _$CurrencyRemoteModelToJson(
        CurrencyRemoteModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'country': instance.country,
      'currency': instance.currency,
      'price': instance.price,
      'flag': instance.flag,
    };
