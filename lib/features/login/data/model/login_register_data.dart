import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_register_data.g.dart';

@JsonSerializable()
class LoginRegisterData extends Equatable {
  final String email;
  final String password;

  const LoginRegisterData({
    required this.email,
    required this.password,
  });

  factory LoginRegisterData.fromJson(Map<String, dynamic> json) =>
      _$LoginRegisterDataFromJson(json);

  @override
  List<Object> get props => [email, password];
}
