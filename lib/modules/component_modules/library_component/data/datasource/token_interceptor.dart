
import 'package:booksphere/config/di.dart';
import 'package:booksphere/modules/component_modules/user_detail_component/domain/repository/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';


class TokenInterceptor extends Interceptor {
  final Dio _dio;
  final AuthRepository _authRepository = getIt.get<AuthRepository>();

  TokenInterceptor(this._dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    // Logger().d("interceptor");

    // Logger().d(options.data);
    String? token = await _authRepository.getSignedInUserToken(false);

    options.headers['Authorization'] = token;
    // Logger().d(options.headers);
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async{
    // Logger().d(err);
    if(err.response?.statusCode==401 && err.response?.statusMessage == "Token is expired"){
      // Logger().d("token expired");

      err.requestOptions.headers['Authorization'] = await _authRepository.getSignedInUserToken(true);
      String? token = await _authRepository.getSignedInUserToken(true);
      handler.resolve(
        await _dio.fetch(err.requestOptions)
      );
    }
  }
}