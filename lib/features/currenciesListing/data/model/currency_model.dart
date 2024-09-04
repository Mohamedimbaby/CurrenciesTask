
import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';
part 'currency_model.g.dart';

@JsonSerializable()
class CountryFlags{

  List<CurrencyRemoteModel> countries ;

  CountryFlags(this.countries);
  factory CountryFlags.fromJson(Map<String, dynamic> json) => _$CountryFlagsFromJson(json);

}
@JsonSerializable()
 class CurrencyData {
  late String code , country;
  String? currency ;
  num? price ;

  CurrencyData(this.code, this.country,{ this.currency, this.price});
  factory CurrencyData.fromJson(Map<String, dynamic> json) => _$CurrencyDataFromJson(json);
  Map<String, dynamic> toJson() => _$CurrencyDataToJson(this);



 }
@JsonSerializable()
class CurrencyRemoteModel extends CurrencyData{
  String flag ;


  CurrencyRemoteModel(this.flag,{required String code,required String country, }) : super(code, country);

  factory CurrencyRemoteModel.fromJson(Map<String, dynamic> json) => _$CurrencyRemoteModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$CurrencyRemoteModelToJson(this);

}
class CurrencyLocalModel extends CurrencyData{
  Uint8List flag ;


  CurrencyLocalModel(this.flag,{required String code,required String country, }) : super(code, country);

}