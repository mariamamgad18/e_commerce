import 'package:dio/dio.dart';
import 'package:ecommerce/api/api_endpoint.dart';
import 'package:ecommerce/api/api_services.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class GetItModules {
  @singleton
  @injectable
  BaseOptions provideBaseOptions() {
    return BaseOptions(
      baseUrl: ApiEndpoint.BaseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );
  }

  @singleton
  @injectable
  PrettyDioLogger ProvidePrettyDioLogger() {
    return PrettyDioLogger(
      request: true,
      responseBody: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
      error: true,
    );
  }

  Dio ProvideDio(BaseOptions baseOptions, PrettyDioLogger prettyDioLogger) {
    var dio = Dio(baseOptions);
    dio.interceptors.add(prettyDioLogger);
    return dio;
  }

  @singleton
  @injectable
  ApiServices provideApiServices(Dio dio) => ApiServices(dio);
}
