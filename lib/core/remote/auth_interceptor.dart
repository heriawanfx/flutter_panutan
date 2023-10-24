import 'package:dio/dio.dart';
import '../../di/injector.dart';
import '../auth/data/datasources/auth_local_datasource.dart';
import '../auth/domain/repositories/auth_repository.dart';

class AuthInterceptor extends Interceptor {
  final AuthLocalDataSource authLocalDataSource;

  AuthInterceptor({required this.authLocalDataSource});

  Future<Map<String, dynamic>> _getTokenHeaderMap() async {
    Map<String, String> headers = {};

    final authData = await authLocalDataSource.getAuthData();

    String? jwtToken = authData?.jwtToken;
    if (jwtToken != null) {
      headers['Authorization'] = "Bearer $jwtToken";
    }

    return headers;
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (!options.uri.path.contains('login') ||
        !options.uri.path.contains('register')) {
      options.headers.addAll(await _getTokenHeaderMap());
    }

    return handler.next(options);
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) async {
    //Unaunthenticated Handler
    if ((response.statusCode ?? 0) >= 400 &&
        (response.statusCode ?? 0) <= 403) {
      Dio dio = getInstance();
      AuthRepository authRepository = getInstance();

      await authRepository.reLogin();

      RequestOptions requestOptions = response.requestOptions;

      final opts = Options(method: requestOptions.method);
      opts.headers?.addAll(await _getTokenHeaderMap());

      final newResponse = await dio.request(
        requestOptions.path,
        options: opts,
        cancelToken: requestOptions.cancelToken,
        onReceiveProgress: requestOptions.onReceiveProgress,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
      );
      handler.resolve(newResponse);
    }

    return handler.next(response);
  }
}
