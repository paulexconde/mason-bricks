import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/shared/providers/local_storage.dart';
import '/features/auth/ui/providers/auth_provider.dart';

// This http client comes with provider
class AuthenticationCustomInterceptor extends Interceptor {
  final Dio dioReference;
  final FlutterSecureStorage _localStorage;
  final Ref _ref;
  String? accessToken;
  AuthenticationCustomInterceptor(
      this.dioReference, this._localStorage, this._ref);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final aToken = await _localStorage.read(key: 'access_token');
    options.headers['Authorization'] = "Bearer $aToken";
    return handler.next(options);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 &&
        err.response?.data["detail"] == 'Token is invalid or expired') {
      _ref.read(authProvider.notifier).forceLogOut();
      return err;
    }

    if (err.response?.statusCode == 401 &&
        err.response?.data["code"] == 'token_not_valid') {
      if (await _localStorage.containsKey(key: 'refresh_token')) {
        await _refreshToken();
        return handler.resolve(await _retry(err.requestOptions));
      }
    }
    return handler.next(err);
  }

  Future<void> _refreshToken() async {
    final refreshToken = await _localStorage.read(key: 'refresh_token');
    final response = await dioReference
        .post('/auth/refresh/', data: {'refresh': refreshToken});

    if (response.statusCode == 201 || response.statusCode == 200) {
      // accessToken = response.data["access"];
      await _localStorage.write(
          key: 'access_token', value: response.data["access"]);
      await _localStorage.write(
          key: 'refresh_token', value: response.data["refresh"]);
    } else {
      // accessToken = null;
      _localStorage.deleteAll();
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options =
        Options(method: requestOptions.method, headers: requestOptions.headers);
    return dioReference.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }
}

extension DioErrorX on DioError {
  bool get isNoConnectionError =>
      type == DioErrorType.other && error is SocketException;
}

final httpClientProvider = Provider<Dio>((ref) {
  final dio = Dio(BaseOptions(baseUrl: 'http://localhost:8000'));
  final localStorage = ref.read(localStorageProvider);
  return dio
    ..interceptors
        .addAll([AuthenticationCustomInterceptor(dio, localStorage, ref)]);
}, name: "Dio");
