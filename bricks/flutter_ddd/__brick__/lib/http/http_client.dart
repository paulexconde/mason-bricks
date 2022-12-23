import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// This http client comes with provider
class CustomInterceptor extends Interceptor {
  final Dio dioReference;

  CustomInterceptor(this.dioReference);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    return handler.next(options);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    return handler.next(err);
  }
}

extension DioErrorX on DioError {
  bool get isNoConnectionError =>
      type == DioErrorType.other && error is SocketException;
}

final httpClientProvider = Provider<Dio>((ref) {
  final dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'));
  return dio..interceptors.addAll([CustomInterceptor(dio)]);
}, name: "Dio");
