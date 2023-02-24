import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/shared/providers/http_client_provider.dart';
import '/shared/providers/local_storage.dart';
import '/features/auth/dto/sign_in_dto.dart';
import '/features/auth/models/auth.dart';

class AuthRepository {
  AuthRepository({required this.ref, required this.httpClientProvider});

  final Ref ref;
  final Provider<Dio> httpClientProvider;

  Future<Auth?> getUser() async {
    try {
      final storage = ref.read(localStorageProvider);
      final token = await storage.read(key: 'access_token');
      if (token == null) return null;

      final response = await ref.read(httpClientProvider).get("/auth/user",
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      final json = response.data["user"]!;

      return Auth.fromJson(json);
    } catch (e) {
      return null;
    }
  }

  FutureOr<void> signIn(String username, String password) async {
    try {
      final response = await ref.read(httpClientProvider).post("/auth/login/",
          data: SignInDTO(username: username, password: password).toJson());
      final json = response.data!;
      final storage = ref.read(localStorageProvider);
      await storage.write(key: 'refresh_token', value: json["refresh"]);
      await storage.write(key: 'access_token', value: json["access"]);

      // return Auth.fromJson(json);
    } catch (e) {
      print(e);
      // return null;
    }
  }

  FutureOr<void> signOut() async {
    try {
      final refreshToken =
          await ref.read(localStorageProvider).read(key: 'refresh_token');
      await ref
          .read(httpClientProvider)
          .post('/auth/logout/', data: {'refresh': refreshToken});

      await ref.read(localStorageProvider).deleteAll();
    } catch (e) {}
  }
}

final authRepositoryProvider = Provider(
    (ref) => AuthRepository(ref: ref, httpClientProvider: httpClientProvider));
