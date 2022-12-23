import 'package:hooks_riverpod/hooks_riverpod.dart';

class IsDarkThemeNotifier extends StateNotifier<bool> {
  IsDarkThemeNotifier() : super(false);

  void toggleTheme() {
    state = !state;
  }
}

final isDarkThemeProvider = StateNotifierProvider<IsDarkThemeNotifier, bool>(
    ((ref) => IsDarkThemeNotifier()));
