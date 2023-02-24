import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_dto.freezed.dart';
part 'sign_in_dto.g.dart';

@freezed
class SignInDTO with _$SignInDTO {
  factory SignInDTO({required String username, required String password}) =
      _SignInDTO;

  factory SignInDTO.fromJson(Map<String, Object?> json) =>
      _$SignInDTOFromJson(json);
}
