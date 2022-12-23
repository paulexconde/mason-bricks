import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

// TODO: Define your routes here
final GoRouter router = GoRouter(navigatorKey: _rootNavigatorKey, routes: []);
