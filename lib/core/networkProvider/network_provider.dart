import 'package:dio/dio.dart';

abstract class NetworkProvider {
  late String apiKey ;
  Future<Response> get(String path, {Map<String, dynamic>? queryParams});
  Future<Response> post(String path, {dynamic data});
}