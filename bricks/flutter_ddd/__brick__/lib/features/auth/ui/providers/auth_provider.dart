import 'package:flutter_extra/shared/providers/local_storage.dart';
import 'package:flutter_extra/features/auth/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class Auth extends _$Auth {
  @override
  Future<bool> build() async {
    final user = await ref.watch(authRepositoryProvider).getUser();

    if (user != null) return true;
    return false;
  }

  Future<void> signIn(String username, String password) async {
    try {
      await ref.read(authRepositoryProvider).signIn(username, password);
      state = const AsyncData(true);
    } catch (e) {
      state = const AsyncData(false);
    }
  }

  FutureOr<void> signOut() async {
    try {
      await ref.read(authRepositoryProvider).signOut();
      state = const AsyncData(false);
    } catch (e) {}
  }

  /// This is to force nagivate to login page and it will delete the tokens from the local storage

  FutureOr<void> forceLogOut() {
    try {
      final localStorage = ref.watch(localStorageProvider);
      localStorage.delete(key: 'access_token');
      localStorage.delete(key: 'refresh_token');
      state = const AsyncData(false);
    } catch (e) {}
  }
}
