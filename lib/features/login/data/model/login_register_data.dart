import 'package:equatable/equatable.dart';

class LoginRegisterData extends Equatable {
  final String email;
  final String password;

  const LoginRegisterData({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
