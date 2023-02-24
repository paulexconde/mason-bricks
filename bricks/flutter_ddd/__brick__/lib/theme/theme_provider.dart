import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
class IsDarkTheme extends _$IsDarkTheme {
  @override
  bool build() => false;

  void toggleTheme() {
    state = !state;
  }
}
