import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_storage.g.dart';

AndroidOptions _getAndroidOptions() =>
    const AndroidOptions(encryptedSharedPreferences: true);

@riverpod
FlutterSecureStorage localStorage(LocalStorageRef ref) =>
    FlutterSecureStorage(aOptions: _getAndroidOptions());
