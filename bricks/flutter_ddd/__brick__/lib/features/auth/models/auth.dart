import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.freezed.dart';
part 'auth.g.dart';

@freezed
class Auth with _$Auth {
  factory Auth(
      {required int id,
      required String email,
      String? accessToken,
      String? refreshToken}) = _Auth;

  factory Auth.fromJson(Map<String, Object?> json) => _$AuthFromJson(json);
}
