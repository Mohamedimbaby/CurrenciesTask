import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FlagsService {
  Dio dio = Dio(BaseOptions(baseUrl: "https://flagcdn.com/"));

  FlagsService();

  Future<Uint8List?> getFlag(String flag) async {
    Response response = await dio.get(
      flag,
      options: Options(responseType: ResponseType.bytes),
    );
    if (response.statusCode == 200) {
      return Uint8List.fromList(response.data);
    } else {
      return null;
    }
  }
}
