import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:injectable/injectable.dart';
@lazySingleton
class FlagsJsonReader{
   Future<Map<String, dynamic>> loadJsonData() async {
    final jsonString = await rootBundle.loadString('assets/flags.json');
    final jsonData = jsonDecode(jsonString);
    return jsonData;
  }
}