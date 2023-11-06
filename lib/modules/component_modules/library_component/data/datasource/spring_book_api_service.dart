
import 'package:booksphere/modules/component_modules/library_component/data/datasource/spring_book_api_client.dart';
import 'package:booksphere/modules/component_modules/library_component/data/datasource/token_interceptor.dart';
import 'package:booksphere/utils/spring_book_api_endpoints.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@injectable
class SpringBookApiService {
  SpringBookApiService._();

  static final SpringBookApiService _instance = SpringBookApiService._();

  factory SpringBookApiService() => _instance;

  SpringBookApiClient get springBookApiClient => SpringBookApiClient(_buildDio(SpringBookApiEndpoints.baseUrl));

  Dio _buildDio(String baseUrl) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        contentType: 'application/json',
      ),
    );
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
      ),
    );
    dio.interceptors.add(TokenInterceptor(dio));
    return dio;
  }
}