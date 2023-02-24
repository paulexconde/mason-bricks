import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/features/auth/ui/screens/auth_screen.dart';
import '/features/auth/ui/screens/splash_screen.dart';
import '/routing/base_layout.dart';
import '/routing/router_notifier.dart';
import '/routing/states.dart';

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
