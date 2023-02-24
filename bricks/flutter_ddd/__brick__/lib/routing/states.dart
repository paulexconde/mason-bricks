import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final routeTitleProvider = StateProvider<String>((ref) => 'Dashboard');

final rootNavigationKey = GlobalKey<NavigatorState>();

final shellNavigationKey = GlobalKey<NavigatorState>();
