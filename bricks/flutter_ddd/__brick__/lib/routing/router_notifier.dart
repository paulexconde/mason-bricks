import 'package:flutter/material.dart';
import 'package:flutter_extra/features/auth/ui/providers/auth_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_notifier.g.dart';

@riverpod
class RouterNotifier extends _$RouterNotifier implements Listenable {
  VoidCallback? routerListener;
  bool isAuth = false;

  @override
  Future<void> build() async {
    isAuth = await ref.watch(authProvider.future);
    ref.listenSelf((_, __) {
      if (state.isLoading) return;
      routerListener?.call();
    });
  }

  /// Redirects the user when our authentication changes
  String? redirect(BuildContext context, GoRouterState state) {
    if (this.state.isLoading || this.state.hasError) return null;

    final isSplash = state.location == '/splash';

    if (isSplash) {
      return isAuth ? "/dashboard" : "/login";
    }

    final isLoggingIn = state.location == "/login";
    if (isLoggingIn) return isAuth ? "/dashboard" : null;

    return isAuth ? null : "/splash";
  }

  @override
  void addListener(VoidCallback listener) {
    routerListener = listener;
  }

  @override
  void removeListener(VoidCallback listener) {
    routerListener = null;
  }
}
