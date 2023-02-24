import 'package:flutter_extra/features/auth/ui/screens/auth_screen.dart';
import 'package:flutter_extra/features/auth/ui/screens/splash_screen.dart';
import 'package:flutter_extra/routing/base_layout.dart';
import 'package:flutter_extra/routing/router_notifier.dart';
import 'package:flutter_extra/routing/states.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final notifier = ref.watch(routerNotifierProvider.notifier);

  return GoRouter(
    initialLocation: "/dashboard",
    navigatorKey: rootNavigationKey,
    refreshListenable: notifier,
    redirect: notifier.redirect,
    routes: <RouteBase>[
      // auth
      GoRoute(
        path: '/login',
        builder: (context, state) => const AuthScreen(),
      ),
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      )
    ],
  );
}
