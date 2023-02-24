// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignInDTO _$SignInDTOFromJson(Map<String, dynamic> json) {
  return _SignInDTO.fromJson(json);
}

/// @nodoc
mixin _$SignInDTO {
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignInDTOCopyWith<SignInDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInDTOCopyWith<$Res> {
  factory $SignInDTOCopyWith(SignInDTO value, $Res Function(SignInDTO) then) =
      _$SignInDTOCopyWithImpl<$Res, SignInDTO>;
  @useResult
  $Res call({String username, String password});
}

/// @nodoc
class _$SignInDTOCopyWithImpl<$Res, $Val extends SignInDTO>
    implements $SignInDTOCopyWith<$Res> {
  _$SignInDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SignInDTOCopyWith<$Res> implements $SignInDTOCopyWith<$Res> {
  factory _$$_SignInDTOCopyWith(
          _$_SignInDTO value, $Res Function(_$_SignInDTO) then) =
      __$$_SignInDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username, String password});
}

/// @nodoc
class __$$_SignInDTOCopyWithImpl<$Res>
    extends _$SignInDTOCopyWithImpl<$Res, _$_SignInDTO>
    implements _$$_SignInDTOCopyWith<$Res> {
  __$$_SignInDTOCopyWithImpl(
      _$_SignInDTO _value, $Res Function(_$_SignInDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_$_SignInDTO(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SignInDTO implements _SignInDTO {
  _$_SignInDTO({required this.username, required this.password});

  factory _$_SignInDTO.fromJson(Map<String, dynamic> json) =>
      _$$_SignInDTOFromJson(json);

  @override
  final String username;
  @override
  final String password;

  @override
  String toString() {
    return 'SignInDTO(username: $username, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInDTO &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, username, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignInDTOCopyWith<_$_SignInDTO> get copyWith =>
      __$$_SignInDTOCopyWithImpl<_$_SignInDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignInDTOToJson(
      this,
    );
  }
}

abstract class _SignInDTO implements SignInDTO {
  factory _SignInDTO(
      {required final String username,
      required final String password}) = _$_SignInDTO;

  factory _SignInDTO.fromJson(Map<String, dynamic> json) =
      _$_SignInDTO.fromJson;

  @override
  String get username;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_SignInDTOCopyWith<_$_SignInDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
