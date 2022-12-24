import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'theme/theme_provider.dart';
import 'theme/theme.dart';
import 'routing/router.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = ref.watch(isDarkThemeProvider);
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
      routerConfig: router,
    );
  }
}