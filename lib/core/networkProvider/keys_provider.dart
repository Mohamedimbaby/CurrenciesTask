import 'package:injectable/injectable.dart';

@module
abstract class KeysProvider {
  @Named('baseUrl')
  String get baseUrl => 'https://api.currencyapi.com/v3/';
  @Named('apiKey')
  String get apiKey => 'cur_live_he8BkaWhPLVUiG8MUO07BZ5LJcDH06J88UMwuSKD&currencies=';
}