import 'package:currencies_converter/core/networkProvider/network_provider.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkProviderModule {
  @lazySingleton
  NetworkProvider provideNetworkProvider(@Named('apiKey') String apiKey,@Named('baseUrl') String baseUrl,) => DioNetworkProvider(apiKey,baseUrl);
}
class DioNetworkProvider extends NetworkProvider{

  final Dio _dio;

  DioNetworkProvider(String apiKey ,String environment) : _dio = Dio(BaseOptions(baseUrl: environment)) {
    _initializeInterceptors();
    super.apiKey = apiKey;
  }

  void _initializeInterceptors() {
    _dio.interceptors.add(
        InterceptorsWrapper(
      onRequest: (options, handler) {
        return handler.next(options); // Continue with the request
      },
      onResponse: (response, handler) {
         return handler.next(response); // Continue with the response
      },
      onError: (DioException error, handler) {
        return handler.next(error); // Continue with the error
      },
    ));
  }
  @override
  Future<Response> get(String path, {Map<String, dynamic>? queryParams}) async {
    return await _dio.get(path, queryParameters: queryParams);
  }
  @override
  Future<Response> post(String path, {dynamic data}) async {
    return await _dio.post(path, data: data);
  }

}