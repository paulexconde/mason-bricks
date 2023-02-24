import 'package:flutter/material.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'snackbar.g.dart';

@riverpod
class GlobalSnackBarController extends _$GlobalSnackBarController {
  @override
  GlobalKey<ScaffoldMessengerState> build() {
    return GlobalKey<ScaffoldMessengerState>();
  }

  void showSnackbar({required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
