import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioModule{
  @lazySingleton
  Dio provideDio() {
    Dio dio = Dio();

    dio.options = BaseOptions(
      baseUrl: "https://ecommerce.routemisr.com",
      receiveTimeout: const Duration(seconds: 120),
      sendTimeout: const Duration(seconds: 120),
      connectTimeout: const Duration(seconds: 120),
      validateStatus: (state) {
        return true;
      },
    );

    dio.interceptors.add(
      PrettyDioLogger(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        maxWidth: 160,
        compact: false,
        enabled: kDebugMode,
      ),
    );

    return dio;
  }

}